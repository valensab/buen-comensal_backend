from django.urls import path
from restaurants.views import RegisterRestaurant

urlpatterns = [
    path('restaurant/',RegisterRestaurant.as_view(), name = 'register_restaurant_api'),
    # path('commensal/',RegisterCommensal.as_view(), name = 'register_commensal_api'),
    # path('login/',Login.as_view(), name = 'user_login_api'),
    # #path('login_restaurant/',LoginRestaurant.as_view(), name = 'user_restaurant_api'),
    # # path('delete/<int:pk>/',user_delete, name = 'user_delete_api'),
    # # path('login/',Login.as_view(), name = 'user_login_api'),
    # #path('logout/',Logout.as_view(), name = 'user_logout_api'),
    # # # path('validate_token/', UserToken.as_view(), name = 'usuario_validate_api' ),
    # # path('change_password/<int:pk>/', user_change_password, name = 'user_change_api' ),
]