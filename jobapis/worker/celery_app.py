import os
import django
from celery import Celery

# Thiết lập biến môi trường Django settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'job.settings')

# Khởi tạo Django (BẮT BUỘC phải chạy trước khi import tasks/models)
django.setup()

# Xây dựng broker URL từ environment variable (hỗ trợ Docker)
_redis_host = os.environ.get('REDIS_HOST', 'localhost')
_redis_port = os.environ.get('REDIS_PORT', '6379')
_broker_url = f"redis://{_redis_host}:{_redis_port}/0"

# Khởi tạo Celery App
celery_app = Celery('jobapis', broker=_broker_url)

# Cấu hình từ file settings (có tiền tố CELERY_)
celery_app.config_from_object('django.conf:settings', namespace='CELERY')

# Autodiscover tasks
celery_app.autodiscover_tasks()
