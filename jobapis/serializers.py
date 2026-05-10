from django.utils import timezone

import cloudinary.api
from rest_framework import serializers

from jobapis.models import User, Company, CompanyImages, Category, JobPosting, Follow, JobApplication, CandidateInfo, Notification, Conversation, \
    Message, InterviewSession, InterviewParticipant, InterviewParticipantLog
from jobapis.worker.tasks import send_email_noti, send_email_verify


# Hàm để xóa ảnh từ Cloudinary
def delete_image_from_cloudinary(image_url):
    # Trích xuất public ID từ URL của Cloudinary
    public_id = image_url.split('/')[-1].split('.')[0]  # Tách public ID từ URL

    try:
        image_delete_result = cloudinary.api.delete_resources(public_id, resource_type="image", type="upload")
        print(image_delete_result)
    except Exception as e:
        print(f"Không thể xóa ảnh: {e}")


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'email', 'avatar', 'user_role', 'phone_number']
        extra_kwargs = {'password': {'write_only': True}}

    def validate_user_role(self, value):
        request = self.context.get('request')

        # Nếu chưa login hoặc không phải admin thì không được tạo role ADMIN/STAFF
        if not request.user.is_authenticated or request.user.user_role not in [User.UserRole.ADMIN]:
            if value in [User.UserRole.ADMIN, User.UserRole.STAFF]:
                raise serializers.ValidationError('You dont have permission to create this account.')

        return value

    def create(self, validated_data):
        data = validated_data.copy()

        user = User(**data)
        user.is_active = False
        user.set_password(user.password)
        user.save()

        send_email_verify.delay(email=user.email, username=user.username)

        return user

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['avatar'] = instance.avatar.url if instance.avatar.url else None

        return data


class MyCvSerializer(serializers.ModelSerializer):
    class Meta:
        model = CandidateInfo
        fields = ['cv', 'updated_at']
        read_only_fields = ['updated_at']

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['cv'] = instance.cv.url if instance.cv else None

        return data


class InfoUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'avatar', 'email', 'phone_number', 'user_role']

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['avatar'] = instance.avatar.url if instance.avatar.url else None

        return data


class CompanyImagesSerializer(serializers.ModelSerializer):
    class Meta:
        model = CompanyImages
        fields = ['id', 'image']
        read_only_fields = ['id']

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['image'] = instance.image.url if instance.image.url else None

        return data


class CompanySerializer(serializers.ModelSerializer):
    user = InfoUserSerializer(read_only=True)
    images = CompanyImagesSerializer(many=True, read_only=True)

    class Meta:
        model = Company
        fields = ['id', 'name', 'description', 'tax_id', 'address', 'status', 'created_at', 'is_active', 'user', 'images']
        read_only_fields = ['id', 'status', 'created_at', 'user', 'images']

    def create(self, validated_data):
        # get user from request
        request = self.context.get('request')
        user = request.user

        # get images from request
        images_data = request.FILES.getlist('images')

        if len(images_data) < 1:
            raise serializers.ValidationError({'images': 'Must have at least 1 images.'})

        # create company
        company = Company.objects.create(user=user, **validated_data)

        # create all img
        for img in images_data:
            CompanyImages.objects.create(company=company, image=img)

        return company


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'logo']

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['logo'] = instance.logo.url if instance.logo.url else None

        return data


class CreateListPostingSerializer(serializers.ModelSerializer):
    checkout_url = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = JobPosting
        fields = ['id', 'title', 'description', 'salary', 'work_time', 'address', 'is_active', 'is_paid', 'created_at', 'company', 'category',
                  'checkout_url']
        read_only_fields = ['id', 'is_active', 'checkout_url', 'is_paid']

    def get_checkout_url(self, obj):
        # Nếu có attach checkout_url từ view thì trả ra, không thì None
        return getattr(obj, "checkout_url", None)

    def create(self, validated_data):
        company = validated_data.get('company')
        if not company.is_active:
            raise serializers.ValidationError({'company': 'Company must be active.'})

        posting = JobPosting.objects.create(**validated_data)

        from .utils import embed_and_save_posting
        embed_and_save_posting(posting)

        return posting


class DetailPostingSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    company = CompanySerializer(read_only=True)
    is_following = serializers.SerializerMethodField()

    class Meta:
        model = JobPosting
        fields = ['id', 'title', 'description', 'salary', 'work_time', 'address', 'is_active', 'created_at', 'company', 'category', 'is_following']
        read_only_fields = ['id', 'is_active']

    def get_is_following(self, obj):
        request = self.context.get('request')

        if not request.user.is_authenticated:
            return False

        follow = Follow.objects.filter(user=request.user, company=obj.company).first()
        if follow:
            return {
                "id": follow.id,
                "user": follow.user.id,
                "company": follow.company.id
            }
        return False


class FollowSerializer(serializers.ModelSerializer):
    class Meta:
        model = Follow
        fields = ['id', 'user', 'company']
        read_only_fields = ['id', 'user']

    def create(self, validated_data):
        request = self.context.get('request')
        user = request.user
        company = validated_data.get('company')

        follow = Follow.objects.filter(user=request.user, company=company).first()

        if follow:
            raise serializers.ValidationError({'not validated': 'You can follow 1 time'})

        return Follow.objects.create(user=user, **validated_data)


class ListFollowSerializer(serializers.ModelSerializer):
    company_info = serializers.SerializerMethodField()

    class Meta:
        model = Follow
        fields = ['id', 'company_info']
        read_only_fields = ['id', 'company_info']

    def get_company_info(self, obj):
        company = obj.company
        data = {
            "name": company.name,
            "address": company.address,
        }

        return data


class CreateApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = JobApplication
        fields = ['id', 'title', 'description', 'cv_file', 'status', 'created_at', 'job_posting']
        read_only_fields = ['id', 'status', 'created_at']
        extra_kwargs = {
            'job_posting': {'required': True, 'allow_null': False},
            'cv_file': {'required': True, 'allow_null': False}
        }

    def create(self, validated_data):
        request = self.context.get('request')
        user = request.user
        posting = JobPosting.objects.get(pk=request.data.get('job_posting'))

        if JobApplication.objects.filter(user=user, job_posting=posting).exists():
            raise serializers.ValidationError(
                {"detail": "You have already applied for this job."}
            )

        return JobApplication.objects.create(user=user, **validated_data)

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['cv_file'] = instance.cv_file.url if instance.cv_file.url else None

        return data


class ListDetailApplicationSerializer(serializers.ModelSerializer):
    user = InfoUserSerializer(read_only=True)
    posting = serializers.SerializerMethodField()

    class Meta:
        model = JobApplication
        fields = ['id', 'title', 'description', 'cv_file', 'status', 'created_at', 'user', 'posting']

    def get_posting(self, obj):
        posting = obj.job_posting

        data = {
            "id": posting.id,
            "title": posting.title,
            "description": posting.description,
            "salary": posting.salary
        }

        return data

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['cv_file'] = instance.cv_file.url if instance.cv_file.url else None

        return data


class CandidateInfoSerializer(serializers.ModelSerializer):
    user = InfoUserSerializer(read_only=True)

    class Meta:
        model = CandidateInfo
        fields = ['cv', 'updated_at', 'user']
        read_only_fields = ['updated_at', 'user']

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['cv'] = instance.cv.url if instance.cv.url else None

        return data

    def create(self, validated_data):
        request = self.context.get('request')
        user = request.user

        info_old = CandidateInfo.objects.filter(user=user).first()
        if info_old and info_old.cv:
            delete_image_from_cloudinary(info_old.cv.url)

        cv_file = validated_data.get("cv")
        if cv_file:
            from .utils import embed_and_save_candidate
            embed_and_save_candidate(user, cv_file)

        candidate_info, created = CandidateInfo.objects.update_or_create(
            user=user,
            defaults={"cv": validated_data.get("cv")}
        )

        return candidate_info


class CandidateRecommendationSerializer(serializers.ModelSerializer):
    similarity = serializers.FloatField()
    candidate_info = CandidateInfoSerializer(read_only=True)

    class Meta:
        model = User
        fields = ['candidate_info', 'similarity']


class PostingRecommendationSerializer(serializers.ModelSerializer):
    similarity = serializers.FloatField()
    posting_info = CreateListPostingSerializer(source='*', read_only=True)

    class Meta:
        model = JobPosting
        fields = ['posting_info', 'similarity']


class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = ['id', 'title', 'content', 'is_read', 'created_at', 'type', 'target_id']


# ─────────────────────── Chat Serializers ───────────────────────

class UserChatSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "avatar"]

    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['avatar'] = instance.avatar.url if instance.avatar.url else None

        return data


class ConversationSerializer(serializers.ModelSerializer):
    order_user = serializers.SerializerMethodField()

    class Meta:
        model = Conversation
        fields = ["id", "last_msg", "updated_at", "order_user"]

    def get_order_user(self, obj):
        request = self.context.get("request")
        user = request.user

        other_user = obj.participants.exclude(id=user.id).first()

        return UserChatSerializer(other_user).data if other_user else None


class MessageSerializer(serializers.ModelSerializer):
    sender = UserChatSerializer(read_only=True)

    class Meta:
        model = Message
        fields = ["id", "content", "created_at", "sender"]


# ─────────────────────── Interview Serializers ───────────────────────

class InterviewParticipantLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = InterviewParticipantLog
        fields = ["id", "joined_at", "left_at"]


class InterviewParticipantSerializer(serializers.ModelSerializer):
    user = UserChatSerializer(read_only=True)
    logs = InterviewParticipantLogSerializer(many=True, read_only=True)

    class Meta:
        model = InterviewParticipant
        fields = ["id", "user", "role", "logs"]


class InterviewSessionSerializer(serializers.ModelSerializer):
    """Dùng cho list + create"""
    host = UserChatSerializer(read_only=True)
    # Employer truyền id của candidate khi tạo - write-only, không trả về
    candidate_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = InterviewSession
        fields = [
            "id", "title", "host",
            "room_name", "meeting_link",
            "start_time", "end_time",
            "status", "is_active", "created_at",
            "candidate_id",
        ]
        read_only_fields = ["id", "host", "room_name", "meeting_link", "status", "created_at"]

    def validate_candidate_id(self, value):
        if not User.objects.filter(pk=value, user_role=User.UserRole.CANDIDATE).exists():
            raise serializers.ValidationError("Candidate not found.")
        return value

    def create(self, validated_data):
        from .utils import create_daily_room
        import uuid

        request = self.context.get("request")
        host = request.user

        # Tách candidate_id ra - không phải field của model
        candidate_id = validated_data.pop("candidate_id")
        candidate = User.objects.get(pk=candidate_id)

        # Tạo room_name unique
        room_name = f"interview-{uuid.uuid4().hex[:12]}"

        # Gọi Daily.co API
        daily_data = create_daily_room(room_name)

        session = InterviewSession.objects.create(
            host=host,
            room_name=daily_data.get("name", room_name),
            meeting_link=daily_data.get("url", ""),
            **validated_data,
        )

        # Thêm Host vào participants
        InterviewParticipant.objects.create(session=session, user=host, role="HOST")

        # Thêm Candidate vào participants ngay từ đầu → candidate thấy phòng qua GET /interviews/
        InterviewParticipant.objects.create(session=session, user=candidate, role="CANDIDATE")

        return session


class InterviewSessionDetailSerializer(serializers.ModelSerializer):
    """Dùng cho retrieve – trả về đầy đủ thông tin kèm participants"""
    host = UserChatSerializer(read_only=True)
    participants = InterviewParticipantSerializer(source="interviewparticipant_set", many=True, read_only=True)

    class Meta:
        model = InterviewSession
        fields = [
            "id", "title", "host",
            "room_name", "meeting_link",
            "start_time", "end_time",
            "status", "is_active", "created_at",
            "participants",
        ]
        read_only_fields = fields
