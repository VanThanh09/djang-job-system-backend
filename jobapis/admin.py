from datetime import timedelta

from django.db.models import Count, Sum
from django.urls import reverse
from django.utils.html import format_html, mark_safe
from django import forms
from django.db.models.functions import TruncMonth
from django.utils import timezone

from django.contrib import admin
import json

from jobapis.models import User, Company, Category, JobPosting, JobApplication, JobPostingFee, Invoice


# Register your models here.
class MyAdminSite(admin.AdminSite):
    site_header = 'QUẢNG LÝ TUYỂN DỤNG'
    index_title = 'BẢNG ĐIỀU KHIỂN'

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


class JobPostingAdmin(admin.ModelAdmin):
    list_display = ('uppercase_title', 'company_link', 'category', 'is_active', 'verification_status')
    list_filter = ('is_verified', 'category')

    # Hàm biến tên công ty thành link
    @admin.display(description='Công ty')  # Đặt tên hiển thị cho cột là "Công ty"
    def company_link(self, obj):
        if obj.company:  # Kiểm tra nếu tin tuyển dụng này có gắn với công ty
            # Lấy URL dẫn đến trang chỉnh sửa của Company đó trong admin
            # Cấu trúc: admin:<app_label>_<model_name>_change
            # Hãy thay 'your_app_name' bằng tên app chứa model Company của bạn nhé!
            url = reverse('admin:jobapis_company_change', args=[obj.company.id])

            # Trả về thẻ HTML link
            return format_html('<a href="{}" style="font-weight: bold; color: #447e9b;">{}</a>', url, obj.company.name)

    @admin.display()
    def uppercase_title(self, obj):
        return obj.title.upper()

    # 1. Hàm thay đổi giá trị hiển thị Yes/No thành ĐÃ XÁC NHẬN / ĐANG CHỜ
    @admin.display(description='Trạng thái xác thực', ordering='is_verified')
    def verification_status(self, obj):
        if obj.is_verified:
            # Bạn có thể thêm màu sắc bằng style css cho đẹp mắt
            return format_html('<span style="color: green; font-weight: bold;">ĐÃ XÁC NHẬN</span>')
        return format_html('<span style="color: orange; font-weight: bold;">ĐANG CHỜ</span>')

    def get_readonly_fields(self, request, obj=None):
        if obj:
            return ('title', 'description', 'created_at', 'is_active', 'salary', 'work_time', 'address', 'company', 'category', 'is_paid')
        return ('created_at',)


class CompanyAdmin(admin.ModelAdmin):
    list_display = ('uppercase_name', 'verification_status')
    list_filter = ('status',)

    def get_readonly_fields(self, request, obj=None):
        if obj:
            return ('name', 'description', 'tax_id', 'address', 'created_at', 'is_active', 'user')
        return ('created_at',)

    @admin.display()
    def uppercase_name(self, obj):
        return obj.name.upper()

    @admin.display(description='Trạng thái xác thực', ordering='status')
    def verification_status(self, obj):
        if obj.status == Company.CompanyStatus.APPROVED:
            return format_html('<span style="color: green; font-weight: bold;">ĐÃ XÁC NHẬN</span>')
        if obj.status == Company.CompanyStatus.PENDING:
            return format_html('<span style="color: orange; font-weight: bold;">ĐANG CHỜ</span>')
        return format_html('<span style="color: red; font-weight: bold;">ĐÃ TỪ CHỐI</span>')


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'posting_count')

    readonly_fields = ('logo_image',)
    fields = ('name', 'logo', 'logo_image')

    @admin.display(description='Hình ảnh logo')
    def logo_image(self, obj):
        if obj.logo:
            return format_html(
                '<img src="{}" style="width: 200px; height: auto; border-radius: 4px;" alt="Logo" />',
                obj.logo
            )
        return format_html('<span style="color: #999; font-style: italic;">Chưa có hình ảnh hoặc link không hợp lệ</span>')

    @admin.display(description='Số lượng bài đăng')
    def posting_count(self, obj):

        return obj.postings.count()


class CustomUserAdminForm(forms.ModelForm):
    class Meta:
        model = User
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if 'user_permissions' in self.fields:
            queryset = self.fields['user_permissions'].queryset

            models_to_exclude = [
                'candidateinfo', 'candidatevector', 'companyimages', 'conversation',
                'follow', 'interviewparticipant', 'interviewparticipantlog',
                'interviewsession', 'message', 'notification', 'postingvector',
                'ratingcompany', 'ratinguser'
            ]

            # 1. Giữ nguyên bộ lọc loại bỏ các model thừa của bạn
            filtered_queryset = queryset.filter(
                content_type__app_label='jobapis'
            ).exclude(
                content_type__model__in=models_to_exclude
            )

            # 2. ĐỊNH NGHĨA LẠI CÁCH HIỂN THỊ (LABEL) CỦA TỪNG DÒNG QUYỀN
            # Tạo một hàm nặc danh (lambda) để format lại chữ hiển thị
            def custom_label_from_instance(obj):
                # obj.codename mặc định sẽ có dạng: 'add_category', 'change_company'...
                codename = obj.codename

                # Lấy tên tiếng Việt của model mà chúng ta đã cấu hình trong class Meta
                # Ví dụ: "danh mục", "công ty", "bài đăng"...
                model_name = obj.content_type.model_class()._meta.verbose_name if obj.content_type.model_class() else obj.content_type.model

                # Tiến hành dịch và làm ngắn gọn theo ý bạn
                if codename.startswith('add_'):
                    return f"{model_name} | Thêm {model_name}"
                elif codename.startswith('change_'):
                    return f"{model_name} | Sửa {model_name}"
                elif codename.startswith('delete_'):
                    return f"{model_name} | Xóa {model_name}"
                elif codename.startswith('view_'):
                    return f"{model_name} | Xem {model_name}"

                return obj.name  # Trả về mặc định nếu là quyền tùy biến khác

            # Gán hàm format nhãn này vào trường user_permissions
            self.fields['user_permissions'].queryset = filtered_queryset
            self.fields['user_permissions'].label_from_instance = custom_label_from_instance


class UserAdmin(admin.ModelAdmin):
    list_display = ("username", "user_role")

    list_filter = ("user_role", )
    exclude = ('is_superuser', 'last_login', 'groups', 'date_joined')

    filter_horizontal = ('user_permissions', )

    form = CustomUserAdminForm

    # overwrite function save default for hash the password
    def save_model(self, request, obj, form, change):
        # check not change (creat new) and 'password' in form.changed_data ( change the password exist)
        if not change or 'password' in form.changed_data:
            obj.set_password(obj.password)  # hass function

        super().save_model(request, obj, form, change)  # call function to save

    def avatar_view(self, obj):
        if obj.avatar:
            return mark_safe(
                f"""
                <div style="width:100px; height:100px; overflow:hidden; border:1px solid gray;">
                    <img src="{obj.avatar.url}" style="width:100%; height:100%; object-fit:cover;" />
                </div>
                """
            )
        return "No avatar"

admin_site = MyAdminSite(name='eShop')

admin_site.register(User, UserAdmin)
admin_site.register(Company, CompanyAdmin)
admin_site.register(Category, CategoryAdmin)
admin_site.register(JobPosting, JobPostingAdmin)
admin_site.register(JobApplication)
admin_site.register(JobPostingFee)
admin_site.register(Invoice)