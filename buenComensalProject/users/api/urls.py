from django.contrib.auth.models import User
from django.urls import path
from users.api.api import user_list, user_delete, user_count, user_change_password
from users.views import  RegisterCommensal, LoginCommensal, UserToken, Logout, CommensalUpdateInfoAPIView, ChangePasswordAPIView,RegisterCommensalManually

urlpatterns = [
    path('list/',user_list, name = 'user_list_api'),
    path('count/',user_count, name = 'user_count_api'),
    path('commensal/',RegisterCommensal.as_view(), name = 'register_commensal_api'),
    path('commensal_manually/',RegisterCommensalManually.as_view(), name = 'register_commensal_manually_api'),
    path('login/',LoginCommensal.as_view(), name = 'commensal_login_api'),
    path('logout/',Logout.as_view(), name = 'commensal_logout_api'),
    path('validate_token/', UserToken.as_view(), name = 'commensal_validate_api' ),
    path('update_info/',CommensalUpdateInfoAPIView.as_view(), name = 'commensal_update_info_api'),
    #path('change_password/', user_change_password, name = 'user_change_api' ),
    path('change_password/', ChangePasswordAPIView.as_view(), name = 'user_change_api' ),
]