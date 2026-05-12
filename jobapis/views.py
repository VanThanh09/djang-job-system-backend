from datetime import datetime, timedelta, timezone

import stripe
import json

from django.db.models import Sum, Count
from django.http import HttpResponse, JsonResponse
from django.utils.timezone import now
from django.views.decorators.csrf import csrf_exempt
from rest_framework import viewsets, generics, parsers, permissions, status
from rest_framework.decorators import action, api_view
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response
from django.db.models.functions import TruncDay, TruncMonth

from jobapis import serializers, perms, paginators
from jobapis.models import User, Company, Category, JobPosting, Follow, JobApplication, CandidateInfo, JobPostingFee, Invoice, Notification, \
    Conversation, Message, InterviewSession, InterviewParticipant, InterviewParticipantLog
from jobapis.utils import recommend_candidates_for_job, recommend_jobs_for_candidate
from django.conf import settings

from django.utils.http import urlsafe_base64_decode
from django.contrib.auth.tokens import default_token_generator

from jobapis.worker.tasks import send_email_noti


@api_view(['GET'])
def revenue_chart_data(request):
    """API trả về dữ liệu doanh thu theo ngày"""

    days = int(request.GET.get('days', 7))

    start_date = now().date() - timedelta(days=days)

    if days < 151:
        orders = (
            Invoice.objects
            .filter(created_at__gte=start_date)
            .annotate(day=TruncDay('created_at'))
            .values('day')
            .annotate(total=Sum('amount'))
            .order_by('day')
        )
        chart_data = [
            {
                "date": item["day"].strftime('%d/%m'),
                "revenue": item["total"]
            }
            for item in orders
        ]
    else:
        orders = (
            Invoice.objects
            .filter(created_at__gte=start_date)
            .annotate(month=TruncMonth('created_at'))
            .values('month')
            .annotate(total=Sum('amount'))
            .order_by('month')
        )
        chart_data = [
            {
                "date": item["month"].strftime('%Y-%m'),
                "revenue": item["total"]
            }
            for item in orders
        ]

    return JsonResponse(chart_data, safe=False)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True).all()
    serializer_class = serializers.UserSerializer
    parser_classes = [parsers.MultiPartParser]

    @action(methods=['get'], url_path='profile', detail=False, permission_classes=[permissions.IsAuthenticated])
    def current_user(self, request):
        user = request.user

        cv = CandidateInfo.objects.filter(user=user).first()
        res = serializers.UserSerializer(request.user).data

        if cv:
            res['candidate_info'] = serializers.MyCvSerializer(cv).data

        return Response(res)

    @action(methods=['get'], url_path='info_user', detail=True)
    def info_user(self, request, pk=None):
        user = User.objects.get(pk=pk)

        return Response(serializers.InfoUserSerializer(user).data)

    @action(methods=["post"], url_path='verify_email', detail=False)
    def verify_email(self, request):
        uid = request.data.get("uid")
        token = request.data.get("token")

        try:
            user_id = urlsafe_base64_decode(uid).decode()
            user = User.objects.get(pk=user_id)
        except:
            return Response({"error": "Invalid UID"}, status=400)

        if default_token_generator.check_token(user, token):
            user.is_active = True
            user.save()
            return Response({"message": "Email verified"}, status=200)
        else:
            return Response({"error": "Invalid token"}, status=400)


class CompanyViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.DestroyAPIView, generics.ListAPIView):
    serializer_class = serializers.CompanySerializer
    parser_classes = [parsers.MultiPartParser]
    pagination_class = paginators.CompanyPage

    def get_queryset(self):
        if self.action == 'destroy':
            return Company.objects.all()

        return Company.objects.filter(is_active=True).all()

    def get_permissions(self):
        if self.action in ['create', 'my_companies']:
            return [perms.IsEmployerPermission()]
        elif self.action in ['destroy', 'change_basic']:
            return [perms.IsOwnerPermission()]
        else:
            return super().get_permissions()

    @action(methods=['patch'], url_path='change_basic', detail=True)
    def change_basic(self, request, pk=None):
        company = Company.objects.get(pk=pk)
        # Check object-level permission
        self.check_object_permissions(request, company)

        # Sử dụng serializer để update partial (chỉ những field user gửi lên)
        serializer = self.serializer_class(company, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data)

    @action(methods=['get'], url_path='my_companies', detail=False)
    def my_companies(self, request):
        company = Company.objects.filter(user=request.user).all()
        return Response(serializers.CompanySerializer(company, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_path='my_company', detail=True)
    def my_company(self, request, pk=None):
        company = Company.objects.get(pk=pk)
        return Response(serializers.CompanySerializer(company).data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_path='my_company_jobs', detail=True)
    def my_company_jobs(self, request, pk=None):
        company = Company.objects.get(pk=pk)

        posting = JobPosting.objects.filter(company=company, is_paid=True).all()
        paginator = paginators.PostingPage()
        page = paginator.paginate_queryset(posting, request)

        return paginator.get_paginated_response(serializers.CreateListPostingSerializer(page, many=True).data)


class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = serializers.CategorySerializer


class PostingViewSet(viewsets.ViewSet, generics.RetrieveAPIView, generics.ListCreateAPIView):
    queryset = JobPosting.objects.filter(is_active=True, is_paid=True).all()
    serializer_class = serializers.CreateListPostingSerializer
    pagination_class = paginators.PostingPage

    def get_permissions(self):
        if self.action in ['create']:
            return [perms.IsCompanyOwnerPermission()]

        return super().get_permissions()

    def get_serializer_class(self):
        if self.action in ['retrieve']:
            return serializers.DetailPostingSerializer

        return super().get_serializer_class()

    def get_queryset(self):
        queryset = self.queryset

        # Tìm kiếm search bar
        q = self.request.query_params.get('q')
        if q:
            queryset = queryset.filter(title__icontains=q)

        cate_id = self.request.query_params.get('categoryId')
        if cate_id:
            queryset = queryset.filter(category__id=cate_id)

        salary_from = self.request.query_params.get('salaryFrom')
        if salary_from:
            queryset = queryset.filter(salary__gte=salary_from)

        salary_to = self.request.query_params.get('salaryTo')
        if salary_to:
            queryset = queryset.filter(salary__lte=salary_to)

        address = self.request.query_params.get('address')
        if address:
            queryset = queryset.filter(address__contains=address)

        work_time = self.request.query_params.get('workTime')
        if work_time:
            queryset = queryset.filter(work_time__lte=work_time)

        return queryset

    def perform_create(self, serializer):
        posting = serializer.save(is_paid=False)

        fee = JobPostingFee.objects.last()
        amount = fee.amount if fee else 200000

        invoice = Invoice.objects.create(
            user=self.request.user,
            posting=posting,
            amount=amount,
        )

        checkout_session = stripe.checkout.Session.create(
            line_items=[
                {
                    "price_data": {
                        "currency": "vnd",
                        "product_data": {"name": f"Đăng tin tuyển dụng: {posting.title}"},
                        "unit_amount": invoice.amount,
                    },
                    'quantity': 1,
                },
            ],
            mode='payment',
            success_url=f"{settings.FRONTEND_URL}/payment/success?session_id={{CHECKOUT_SESSION_ID}}&posting_id={posting.id}",
            cancel_url=f"{settings.FRONTEND_URL}/payment/cancel",
            metadata={"invoice_id": invoice.id},
        )

        posting.checkout_url = checkout_session.url

        return Response(
            self.get_serializer(posting).data,
            status=status.HTTP_201_CREATED
        )

    @action(methods=['get'], url_path='applications', detail=True, permission_classes=[perms.IsPostingOwnerPermission])
    def applications(self, request, pk=None):
        posting = JobPosting.objects.get(pk=pk)

        status = request.query_params.get('status')

        self.check_object_permissions(request, posting)
        applications = posting.applications.all()

        if status:
            applications = applications.filter(status=status)

        paginator = paginators.ApplicationPage()
        page = paginator.paginate_queryset(applications, request)

        return paginator.get_paginated_response(serializers.ListDetailApplicationSerializer(page, many=True).data)

    @action(methods=['get'], url_path='count_applications', detail=True, permission_classes=[perms.IsPostingOwnerPermission])
    def count_applications(self, request, pk=None):
        posting = JobPosting.objects.get(pk=pk)

        self.check_object_permissions(request, posting)
        applications = posting.applications.all()

        count = applications.count()
        count_pe = applications.filter(status=JobApplication.JobApplicationStatus.PENDING).count()
        count_re = applications.filter(status=JobApplication.JobApplicationStatus.REJECTED).count()
        count_ap = applications.filter(status=JobApplication.JobApplicationStatus.APPROVED).count()

        return Response({
            "total": count,
            "pending": count_pe,
            "rejected": count_re,
            "approved": count_ap
        })

    @action(methods=['post'], url_path='change_applications', detail=True, permission_classes=[perms.IsPostingOwnerPermission])
    def change_applications(self, request, pk=None):
        posting = JobPosting.objects.get(pk=pk)
        app_id = request.data.get('application_id')
        app_status = request.data.get('status')

        application = JobApplication.objects.get(pk=app_id)

        self.check_object_permissions(request, posting)

        if app_status not in [JobApplication.JobApplicationStatus.APPROVED, JobApplication.JobApplicationStatus.REJECTED]:
            return Response({"detail": "Invalid status."}, status=400)

        application.status = app_status
        application.save()

        return Response({
            "message": "Application status updated successfully.",
            "new_status": application.status,
        })

    @action(methods=['post'], url_path='change_is_active', detail=True, permission_classes=[perms.IsPostingOwnerPermission])
    def change_is_active(self, request, pk=None):
        posting = JobPosting.objects.get(pk=pk)
        is_active = request.data.get('is_active')

        self.check_object_permissions(request, posting)

        if is_active not in [True, False]:
            return Response({"detail": "Invalid is_active."}, status=400)

        posting.is_active = is_active
        posting.save()

        return Response({
            "message": "Posting active updated successfully.",
            "new_status": posting.is_active,
        })


class FollowViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.DestroyAPIView):
    queryset = Follow.objects.all()
    serializer_class = serializers.FollowSerializer
    pagination_class = paginators.FollowPage
    permission_classes = [permissions.IsAuthenticated]

    def get_permissions(self):
        if self.action in ['destroy']:
            return [perms.IsOwnerPermission()]

        return super().get_permissions()

    def get_queryset(self):
        if self.action in ['list']:
            request = self.request
            return Follow.objects.filter(user=request.user).all()

        return super().get_queryset()

    def get_serializer_class(self):
        if self.action in ['list']:
            return serializers.ListFollowSerializer

        return super().get_serializer_class()


class ApplicationViewSet(viewsets.ViewSet, generics.ListCreateAPIView):
    queryset = JobApplication.objects.all()
    serializer_class = serializers.CreateApplicationSerializer
    pagination_class = paginators.ApplicationPage
    permission_classes = [permissions.IsAuthenticated]

    def get_serializer_class(self):
        if self.action in ['list']:
            return serializers.ListDetailApplicationSerializer

        return super().get_serializer_class()

    def get_queryset(self):
        if self.action in ['list']:
            request = self.request
            return JobApplication.objects.filter(user=request.user).all()

        return super().get_queryset()


class CandidateInfoViewSet(viewsets.ViewSet, generics.ListCreateAPIView):
    queryset = CandidateInfo.objects.all()
    serializer_class = serializers.CandidateInfoSerializer
    pagination_class = paginators.CandidatePage
    permission_classes = [perms.IsCandidatePermission]

    def get_permissions(self):
        if self.action in ['list']:
            return []

        return super().get_permissions()


class CandidateRecommendationViewSet(viewsets.ViewSet, generics.ListAPIView):
    serializer_class = serializers.CandidateRecommendationSerializer
    permission_classes = [perms.IsEmployerPermission]
    pagination_class = paginators.RecommendPage

    def get_queryset(self):
        request = self.request
        job_id = request.query_params.get('job_id')
        threshold = request.query_params.get('threshold', 0.2)

        posting = JobPosting.objects.get(pk=job_id)

        results = recommend_candidates_for_job(posting, threshold)
        candidates = []
        for candidate, score in results:
            candidate.similarity = round(float(score), 4)
            candidates.append(candidate)

        return candidates


class PostingRecommendationViewSet(viewsets.ViewSet, generics.ListAPIView):
    serializer_class = serializers.PostingRecommendationSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = paginators.RecommendPage

    def get_queryset(self):
        request = self.request
        user = request.user
        threshold = request.query_params.get('threshold', 0.2)

        results = recommend_jobs_for_candidate(user, threshold)
        jobs = []
        for job, score in results:
            job.similarity = round(float(score), 4)
            print(job)
            jobs.append(job)

        return jobs


endpoint_secret = settings.STRIPE_WEBHOOK_SECRET


@csrf_exempt
def webhook_view(request):
    payload = request.body
    event = None

    try:
        event = stripe.Event.construct_from(
            json.loads(payload), stripe.api_key
        )
    except ValueError as e:
        # Invalid payload
        return HttpResponse(status=400)

    if endpoint_secret:
        # Only verify the event if you've defined an endpoint secret
        # Otherwise, use the basic event deserialized with JSON
        sig_header = request.headers.get('stripe-signature')
        try:
            event = stripe.Webhook.construct_event(
                payload, sig_header, endpoint_secret
            )
        except stripe.error.SignatureVerificationError as e:
            print('⚠️  Webhook signature verification failed.' + str(e))
            return JsonResponse({"success": False}, status=400)

    # Handle the event
    if event.type == 'checkout.session.completed':
        session = event["data"]["object"]
        invoice_id = session["metadata"]["invoice_id"]

        invoice = Invoice.objects.get(pk=invoice_id)
        invoice.status = "paid"
        invoice.payment_id = session["id"]
        invoice.save()

        invoice.posting.is_paid = True
        invoice.posting.save()

        company = invoice.posting.company
        posting = invoice.posting
        followers = company.followers.all()
        title = f"Công ty {company.name} đăng tin tuyển dụng"

        for f in followers:
            Notification.objects.create(user=f.user, title=title, content=posting.title, type="jobposting", target_id=posting.id)

            created_at_str = posting.created_at.strftime("%d/%m/%Y %H:%M")

            send_email_noti.delay(email=f.user.email,
                                  context={"title": title, "content": posting.title, "target_id": posting.id, "created_at": created_at_str})
    else:
        print('Unhandled event type {}'.format(event.type))

    return HttpResponse(status=200)


class NotificationViewSet(viewsets.ViewSet, generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = serializers.NotificationSerializer
    queryset = Notification.objects.all()

    def get_queryset(self):
        if self.action in ['list']:
            request = self.request
            return Notification.objects.filter(user=request.user).all()

        return super().get_queryset()

    @action(methods=['post'], detail=True, url_path='read_noti', permission_classes=[permissions.IsAuthenticated])
    def read_noti(self, request, pk):
        noti = Notification.objects.get(pk=pk)
        noti.is_read = True
        noti.save()

        return Response({'success': True})


class ConversationViewSet(viewsets.ViewSet, generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = serializers.ConversationSerializer

    def get_queryset(self):
        if self.action in ['list']:
            user = self.request.user
            return Conversation.objects.filter(participants=user).order_by('-updated_at')

    @action(detail=False, methods=['post'])
    def get_or_create(self, request):
        receiver_id = request.data.get('receiverId')
        if not receiver_id:
            return Response({"error": "Missing receiverId"}, status=400)

        user_ids = [request.user.id, int(receiver_id)]

        conversations = Conversation.objects.annotate(
            num_participants=Count('participants')
        ).filter(num_participants=len(user_ids))

        for user_id in user_ids:
            conversations = conversations.filter(participants__id=user_id)

        conv = conversations.first()

        if not conv:
            conv = Conversation.objects.create(last_msg="")
            conv.participants.add(request.user.id, receiver_id)
            conv.save()

        serializer = serializers.ConversationSerializer(conv, context={'request': request})
        return Response(serializer.data)

    # @action(detail=True, methods=['get'])
    # def get_interview_sessions(self, request, pk):
    #     interviews = InterviewSession.objects.filter(conversation_id=pk).order_by('-start_time').all()
    #
    #     serializer = serializers.CreateInterviewSerializer(interviews, many=True)
    #     # 3. Trả về Response với dữ liệu đã được serialize (.data)
    #     return Response(serializer.data, status=status.HTTP_200_OK)


class MessageViewSet(viewsets.ViewSet, generics.ListAPIView):
    serializer_class = serializers.MessageSerializer
    pagination_class = paginators.MessagePaginator
    permission_classes = [perms.IsUserInConversation]

    def get_queryset(self):
        if self.action in ['list']:
            conversation_id = self.request.query_params.get('conversation_id')

            if not conversation_id:
                raise ValidationError({"conversation_id": "This field is required."})

            if conversation_id:
                return Message.objects.filter(conversation_id=conversation_id).order_by('-created_at')


# class CreateRoomAPIView(generics.GenericAPIView):
#     serializer_class = serializers.CreateRoomSerializer
#
#     def post(self, request):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#
#         room_name = serializer.validated_data.get("room_name")
#
#         data = create_daily_room(room_name)
#
#         return Response({
#             "room_name": data.get("name"),
#             "room_url": data.get("url")
#         })


class InterviewSessionViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.RetrieveAPIView):
    """
    - list   : GET  /interviews/              – các session mà user tham gia (host or participant)
    - create : POST /interviews/              – tạo session mới (Employer), Daily room được tạo tự động
    - retrieve : GET /interviews/<pk>/        – chi tiết session kèm participants
    - join   : POST /interviews/<pk>/join/    – user vào phòng, trả về meeting_link
    - end    : POST /interviews/<pk>/end/     – host kết thúc session
    - by_conversation : GET /interviews/by_conversation/?conversation_id=<id>
    """
    serializer_class = serializers.InterviewSessionSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        # Lấy tất cả session mà user là host hoặc participant
        as_host = InterviewSession.objects.filter(host=user)
        as_participant = InterviewSession.objects.filter(
            interviewparticipant__user=user
        )
        return (as_host | as_participant).distinct().order_by("-created_at")

    def get_serializer_class(self):
        if self.action in ["retrieve"]:
            return serializers.InterviewSessionDetailSerializer
        return super().get_serializer_class()

    # -------- join action --------
    @action(detail=True, methods=["post"], url_path="join")
    def join(self, request, pk=None):
        session = InterviewSession.objects.get(pk=pk)

        if session.status in ["DONE", "CANCELLED"]:
            return Response({"detail": "Session is no longer active."}, status=status.HTTP_400_BAD_REQUEST)


        time_diff = session.start_time - datetime.now(timezone.utc)
        if time_diff > timedelta(minutes=10):
            return Response({"detail": "Chỉ được tham gia trước 10 phút."}, status=status.HTTP_400_BAD_REQUEST)

        # Tạo hoặc lấy participant record
        participant, _ = InterviewParticipant.objects.get_or_create(
            session=session,
            user=request.user,
            defaults={"role": "CANDIDATE"}
        )

        # Tạo log vào phòng
        from django.utils.timezone import now as tz_now
        InterviewParticipantLog.objects.create(
            participant=participant,
            joined_at=tz_now(),
        )

        # Nếu session đang PENDING thì chuyển ONGOING
        if session.status == "PENDING":
            session.status = "ONGOING"
            session.save(update_fields=["status"])

        return Response({
            "meeting_link": session.meeting_link,
            "room_name": session.room_name,
            "status": session.status,
        })

    # -------- end action --------
    @action(detail=True, methods=["post"], url_path="end")
    def end(self, request, pk=None):
        session = InterviewSession.objects.get(pk=pk)

        if session.host != request.user:
            return Response({"detail": "Only the host can end the session."}, status=status.HTTP_403_FORBIDDEN)

        if session.status in ["DONE", "CANCELLED"]:
            return Response({"detail": "Session already ended."}, status=status.HTTP_400_BAD_REQUEST)

        from django.utils.timezone import now as tz_now
        now_time = tz_now()

        if now_time <= session.end_time:
            return Response({"detail": "Session is still within active time, ignored."}, status=status.HTTP_200_OK)

        session.status = "DONE"
        session.save(update_fields=["status"])

        # Đồng thời đóng log cho tất cả participant chưa được ghi left_at
        for participant in session.interviewparticipant_set.all():
            participant.logs.filter(left_at__isnull=True).update(left_at=now_time)

        return Response({"detail": "Session ended.", "status": session.status})