from django.urls import path
from suggestions.views import ScoreRegister

urlpatterns = [
 path('score/',ScoreRegister.as_view(), name = 'register_score_api')]