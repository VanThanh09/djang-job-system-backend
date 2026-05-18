from django.apps import AppConfig


class JobapisConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'jobapis'

    # Thêm dòng này để đổi tên phân hệ lớn trên thanh Menu Admin
    verbose_name = 'Quản Lý Tuyển Dụng'
