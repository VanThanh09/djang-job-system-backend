from django.urls import path, include
from rest_framework import routers

from . import views
from .views import ConversationViewSet, MessageViewSet, InterviewSessionViewSet

router = routers.DefaultRouter()

router.register('users', views.UserViewSet, basename='users')
router.register('companies', views.CompanyViewSet, basename='companies')
router.register('categories', views.CategoryViewSet, basename='categories')
router.register('posting', views.PostingViewSet, basename='posting')
router.register('follow', views.FollowViewSet, basename='follow')
router.register('application', views.ApplicationViewSet, basename='application')
router.register('candidates', views.CandidateInfoViewSet, basename='candidates')
router.register('recommendations', views.CandidateRecommendationViewSet, basename='recommendations')
router.register('your-job-rcm', views.PostingRecommendationViewSet, basename='your-job-rcm')
router.register('notifications', views.NotificationViewSet, basename='notifications')
router.register('conversations', ConversationViewSet, basename='conversations')
router.register('messages', MessageViewSet, basename='messages')
router.register('interviews', InterviewSessionViewSet, basename='interviews')

urlpatterns = [
    path('stripe/webhook/', views.webhook_view, name='stripe-webhook'),
    path('revenue/', views.revenue_chart_data),
    path('', include(router.urls)),
]
