from datetime import timedelta

from django.db.models import Count, Sum
from django.db.models.functions import TruncMonth
from django.utils import timezone

from django.contrib import admin
import json

from jobapis.models import User, Company, Category, JobPosting, JobApplication, JobPostingFee, Invoice


# Register your models here.
class MyAdminSite(admin.AdminSite):
    site_header = 'ADMIN PAGE'
    index_title = 'Admin Dashboard'

    def each_context(self, request):
        context = super().each_context(request)

        now = timezone.now()
        last_30_days = now - timedelta(days=30)
        last_year = now - timedelta(days=365)

        user_per_month = (
            User.objects
            .filter(date_joined__gte=last_year)
            .annotate(month=TruncMonth('date_joined'))
            .values('month')
            .annotate(count=Count('id'))
            .order_by('month')
        )

        labels = [entry['month'].strftime('%Y-%m') for entry in user_per_month]
        counts = [entry['count'] for entry in user_per_month]
        context['user_chart_labels'] = json.dumps(labels)
        context['user_chart_data'] = json.dumps(counts)

        context['total_users'] = User.objects.count()
        context['total_candidate'] = User.objects.filter(user_role=User.UserRole.CANDIDATE).count()
        context['total_employee'] = User.objects.filter(user_role=User.UserRole.EMPLOYER).count()

        context['total_company'] = Company.objects.count()
        context['total_jobposting'] = JobPosting.objects.filter(is_paid=True).count()
        context['total_jobposting_active'] = JobPosting.objects.filter(is_paid=True, is_active=True).count()

        context['total_jobapplication'] = JobApplication.objects.count()
        appli_month = JobApplication.objects.filter(created_at__gte=last_30_days).count()
        context['total_jobapplication_month'] = appli_month

        revenue_30_days = Invoice.objects.filter(
            status="paid",
            created_at__gte=last_30_days
        ).aggregate(
            total_price=Sum("amount")
        )['total_price'] or 0

        revenue_1_year = Invoice.objects.filter(
            status="paid",
            created_at__gte=last_year
        ).aggregate(
            total_price=Sum("amount")
        )['total_price'] or 0

        context.update({
            'revenue_30_days': "{:,.0f}".format(revenue_30_days),
            'revenue_1_year': "{:,.0f}".format(revenue_1_year)
        })

        top_categories = list(
            Category.objects.annotate(job_count=Count('postings'))
            .order_by('-job_count')
            .values('name', 'job_count')[:5]
        )

        context['top_categories'] = top_categories

        revenue_by_company = list(Invoice.objects.filter(
            status="paid",
        ).values('user__id', 'user__first_name', 'user__avatar').annotate(
            total_revenue=Sum("amount")
        ).order_by('-total_revenue'))[:5]

        context.update({
            'top_store': [
                (
                    store['user__id'],
                    store['user__first_name'],
                    store['user__avatar'],
                    "{:,.0f}".format(store['total_revenue'] or 0)
                )
                for store in revenue_by_company
            ]
        })

        return context


admin_site = MyAdminSite(name='eShop')

admin_site.register(User)
admin_site.register(Company)
admin_site.register(Category)
admin_site.register(JobPosting)
admin_site.register(JobApplication)
admin_site.register(JobPostingFee)
admin_site.register(Invoice)
