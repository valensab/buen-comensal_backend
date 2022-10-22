from django.urls import path
from suggestions.views import ScoreRegister, CommentsRegister

urlpatterns = [
    path('score/',ScoreRegister.as_view(), name = 'register_score_api'),
    path('comments/',CommentsRegister.as_view(), name = 'register_comments_api')]