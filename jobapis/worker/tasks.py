from typing import Any

from django.conf import settings
from django.core.mail import send_mail

from jobapis.utils import render_email_template, generate_verify_token
from jobapis.worker.celery_app import celery_app


@celery_app.task(bind=True, autoretry_for=(Exception,), retry_backoff=5, retry_kwargs={"max_retries": 3})
def send_email_noti(self, email: str, context: dict[str, Any]) -> dict:
    # 1. Render file HTML từ template MJML đã build (giả sử tên là recruitment_notice.html)
    # Context sẽ chứa: title, content, created_at, target_id
    html_content = render_email_template(
        template_name="notis.html",
        context=context,
    )

    # 2. Tạo bản text thuần (Fallback) để phòng trường hợp trình duyệt mail cũ không đọc được HTML
    text_content = f"{context.get('title')}\n\nVị trí: {context.get('content')}\nXem tại: {settings.FRONTEND_URL}/jobs/{context.get('target_id')}"

    # 3. Gửi mail với tham số html_message
    send_mail(
        subject=context.get('title', 'Thông báo từ BigAdmin'),
        message=text_content,  # Bản text thuần
        from_email="no-reply@gmail.com",
        recipient_list=[email],
        html_message=html_content,  # ĐÂY LÀ PHẦN QUAN TRỌNG NHẤT
        fail_silently=False,
    )

    return {"success": True, "to": email}

@celery_app.task(bind=True, autoretry_for=(Exception,), retry_backoff=5, retry_kwargs={"max_retries": 3})
def send_email_verify(self, email: str, username: str) -> dict:
    from django.contrib.auth import get_user_model
    User = get_user_model()
    try:
        user = User.objects.get(email=email)
    except User.DoesNotExist:
        return {"success": False, "error": "User not found"}

    uid, token = generate_verify_token(user)

    verify_link = f"{settings.FRONTEND_URL}/verify-email?uid={uid}&token={token}"

    message = f"""
    Kính gửi {username},

    Cảm ơn Quý khách đã đăng ký tài khoản với chúng tôi.

    Để hoàn tất quá trình đăng ký, vui lòng nhấp vào liên kết dưới đây để xác minh địa chỉ email của Quý khách:
    {verify_link}

    Nếu Quý khách không thực hiện yêu cầu này, vui lòng bỏ qua email này.

    Trân trọng,
    Đội ngũ hỗ trợ
    """

    send_mail(
        "Xác minh tài khoản của bạn",
        message,
        settings.DEFAULT_FROM_EMAIL,
        [email],
    )

    return {"success": True, "to": email}

