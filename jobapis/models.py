from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _
from cloudinary.models import CloudinaryField


class User(AbstractUser):
    class UserRole(models.TextChoices):
        ADMIN = 'AD', _("ADMIN")
        STAFF = 'ST', _("STAFF")
        EMPLOYER = 'EM', _("EMPLOYER")
        CANDIDATE = 'CA', _("CANDIDATE")

    avatar = CloudinaryField(null=True)
    user_role = models.CharField(max_length=2, choices=UserRole, default=UserRole.CANDIDATE)
    phone_number = models.CharField(max_length=32, unique=True)
    email = models.CharField(max_length=64, unique=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class CandidateInfo(models.Model):
    cv = CloudinaryField(null=True)
    updated_at = models.DateTimeField(auto_now=True)

    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='candidate_info')

    def __str__(self):
        return f"CV thêm lúc {self.updated_at}"


class CandidateVector(models.Model):
    candidate = models.OneToOneField(User, on_delete=models.CASCADE)
    dim = models.IntegerField(default=768)
    vector = models.BinaryField(null=True, blank=True)


class Company(models.Model):
    class CompanyStatus(models.TextChoices):
        APPROVED = 'AP', _("APPROVED")
        REJECTED = 'RE', _("REJECTED")
        PENDING = 'PE', _("PENDING")

    name = models.CharField(max_length=255)
    description = models.TextField()
    tax_id = models.CharField(max_length=100)
    address = models.TextField()
    status = models.CharField(max_length=2, choices=CompanyStatus.choices, default=CompanyStatus.APPROVED)
    created_at = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='companies')

    def __str__(self):
        return f"{self.name}"


class CompanyImages(models.Model):
    image = CloudinaryField(null=True)

    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='images')


class Category(models.Model):
    name = models.CharField(max_length=255)
    logo = CloudinaryField(null=True)

    def __str__(self):
        return f"{self.name}"


class JobPosting(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    salary = models.IntegerField()
    work_time = models.IntegerField()
    address = models.TextField()
    is_active = models.BooleanField(default=True)
    is_paid = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='postings')
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, blank=True, null=True, related_name='postings')

    def __str__(self):
        return f"{self.title}"


class PostingVector(models.Model):
    posting = models.OneToOneField(JobPosting, on_delete=models.CASCADE)
    dim = models.IntegerField(default=768)
    vector = models.BinaryField(null=True, blank=True)


class JobApplication(models.Model):
    class JobApplicationStatus(models.TextChoices):
        PENDING = 'PE', _("PENDING")
        APPROVED = 'AP', _("APPROVED")
        REJECTED = 'RE', _("REJECTED")

    title = models.CharField(max_length=255)
    description = models.TextField()
    cv_file = CloudinaryField(null=True)
    status = models.CharField(max_length=2, choices=JobApplicationStatus, default=JobApplicationStatus.PENDING)
    created_at = models.DateTimeField(auto_now_add=True)

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='applications')
    job_posting = models.ForeignKey(JobPosting, on_delete=models.SET_NULL, null=True, blank=True, related_name='applications')

    def __str__(self):
        return f"{self.user.first_name} apply for: {self.job_posting.title} - status: {self.status}"


class Notification(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    type = models.CharField(max_length=255)
    target_id = models.CharField(max_length=255)  # Chuyển tới trang nào khi ấn vào

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notifications')

    def __str__(self):
        return f"{self.title}"


class Follow(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='following')
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='followers')


class BaseRating(models.Model):
    rating = models.FloatField()
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        abstract = True


class RatingUser(BaseRating):
    target = models.ForeignKey(User, on_delete=models.CASCADE, related_name='ratings_received')

    def __str__(self):
        return f"{self.rating} - {self.comment}"


class RatingCompany(BaseRating):
    target = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='ratings_received')

    def __str__(self):
        return f"{self.rating} - {self.comment}"


class JobPostingFee(models.Model):
    amount = models.IntegerField(default=200000)  # số tiền VND
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.amount} VND"


class Invoice(models.Model):
    STATUS_CHOICES = (
        ("pending", "Chờ thanh toán"),
        ("paid", "Đã thanh toán"),
    )

    amount = models.IntegerField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="pending")
    created_at = models.DateTimeField(auto_now_add=True)
    payment_id = models.CharField(max_length=255, blank=True, null=True)  # lưu id giao dịch Stripe

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='invoices')
    posting = models.OneToOneField(JobPosting, on_delete=models.CASCADE, related_name="invoice")

    def __str__(self):
        return f"Invoice {self.id} - {self.status} - {self.amount} VND"


class Conversation(models.Model):
    participants = models.ManyToManyField(User, related_name='conversations')
    last_msg = models.TextField()
    last_sender = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='last_sender', blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True)


class Message(models.Model):
    conversation = models.ForeignKey(Conversation, on_delete=models.CASCADE, related_name='messages')
    sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name='messages')
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)


# models.py
class InterviewSession(models.Model):
    STATUS_CHOICES = (
        ("PENDING", "Sắp diễn ra"),
        ("ONGOING", "Đang diễn ra"),
        ("DONE", "Đã kết thúc"),
        ("CANCELLED", "Đã huỷ"),
    )
    title = models.CharField(max_length=255)
    host = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='interview_hosts'
    )
    room_name = models.CharField(max_length=255, unique=True)
    meeting_link = models.URLField(null=True, blank=True)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default="PENDING"
    )
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class InterviewParticipant(models.Model):
    ROLE_CHOICES = (
        ("HOST", "Host"),
        ("CANDIDATE", "Candidate"),
    )
    session = models.ForeignKey(InterviewSession, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    role = models.CharField(max_length=20, default="CANDIDATE")

    class Meta:
        unique_together = ("session", "user")


class InterviewParticipantLog(models.Model):
    participant = models.ForeignKey(
        InterviewParticipant,
        on_delete=models.CASCADE,
        related_name="logs"
    )

    joined_at = models.DateTimeField()
    left_at = models.DateTimeField(null=True, blank=True)
