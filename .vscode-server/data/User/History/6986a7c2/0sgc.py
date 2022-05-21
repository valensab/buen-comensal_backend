from restaurants.views import RegisterRestaurant, LoginRestaurant, ImagenRestaurant, UserToken, Logout
from django.urls import path
from restaurants.api.api import restaurant_list, imagen_list

urlpatterns = [
    path('restaurant/',RegisterRestaurant.as_view(), name = 'register_restaurant_api'),
    path('list/',restaurant_list, name = 'restaurant_list_api'), 
    path('login/',LoginRestaurant.as_view(), name = 'restaurant_login_api'),
    path('gallery/', ImagenRestaurant.as_view(), name = 'restaurant_imagen_api'),
    path('validate_token/', UserToken.as_view(), name = 'restaurant_validate_api' ),
    path('logout/',Logout.as_view(), name = 'user_logout_api'),
    path('listGallery/<int:pk>', imagen_list, name = 'restaurant_imagen_list_api')
]