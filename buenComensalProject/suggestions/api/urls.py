from django.urls import path
from suggestions.views import ScoreRegister, CommentsRegister,FavoriteRegister
from suggestions.api.api import score_list, score_list_restaurant,comments_list_restaurant,favorites_list_restaurant, favorites_delete, comments_restaurant

urlpatterns = [
    path('score/',ScoreRegister.as_view(), name = 'register_score_api'),
    path('comments/',CommentsRegister.as_view(), name ='register_comments_api'),
    path('favorites/',FavoriteRegister.as_view(), name ='register_favorites_api'),
    path('score_list_restaurant/<int:pk>/',score_list_restaurant, name ='score_list_restaurant_api'),
    path('score_list/',score_list, name = 'score_list_api'),
    path('comments_list_restaurant/<int:pk>/',comments_list_restaurant, name = 'comments_list_restaurant_api'),
    path('suggestions_restaurant/<int:pk>/',comments_restaurant, name = 'comments_restaurant_api'),
    path('favorites_list_restaurant/<int:pk>/',favorites_list_restaurant, name = 'favorites_list_restaurant_api'),
    path('favorites_delete/', favorites_delete, name = 'favorites_delete')
    ]