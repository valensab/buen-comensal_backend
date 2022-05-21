from restaurants.views import RegisterRestaurant, LoginRestaurant, ImagenRestaurant, UserToken, Logout, RestaurantUpdateAPIView, UpdateContanctAPIView, RestaurantUpdateMenuAPIView, RestaurantUpdateDescriptionAPIView
from django.urls import path
from restaurants.api.api import restaurant_list, imagen_list, imagen_delete, restaurant_list
urlpatterns = [
    path('restaurant/',RegisterRestaurant.as_view(), name = 'register_restaurant_api'),
    path('list/',restaurant_list, name = 'restaurant_list_api'), 
    path('login/',LoginRestaurant.as_view(), name = 'restaurant_login_api'),
    path('gallery/', ImagenRestaurant.as_view(), name = 'restaurant_imagen_api'),
    # path('tags/', TagsRestaurantAPIView.as_view(), name = 'restaurant_tag_api'),
    # path('list_tags/', tags_list, name = 'restaurant_tag_api'),
    # path('tags_list_user/<int:pk>/', tags_list_user, name = 'restaurant_tag_api'),
    path('validate_token/', UserToken.as_view(), name = 'restaurant_validate_api'),
    path('logout/',Logout.as_view(), name = 'user_logout_api'),
    path('list_gallery/<int:pk>/', imagen_list, name = 'restaurant_imagen_list_api'),
    path('imagen_delete/<int:pk>', imagen_delete, name = 'imagen_delete'),
    #path('tags_filter/', TagsFilterListAPIView.as_view(), name = 'tags_filter_restaurant'),
    #path('tags_filter_list/', tags_filter_list, name = 'tags_filter_restaurant'),
    path('restaurant_update/<int:pk>/',RestaurantUpdateAPIView.as_view(), name = 'restaurant_update_api'),
    path('update_contact/<int:pk>/',UpdateContanctAPIView.as_view(), name = 'restaurant_update_contact_api'),
    path('update_menu/<int:pk>/',RestaurantUpdateMenuAPIView.as_view(), name = 'restaurant_update_menu_api'),
    path('update_description/<int:pk>/',RestaurantUpdateDescriptionAPIView.as_view(), name = 'restaurant_update_description_api'),

]