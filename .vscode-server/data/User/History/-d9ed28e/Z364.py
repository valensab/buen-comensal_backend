from django.contrib import admin
from users.models import User
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    list_display = ('id','name','last_name','is_active','is_commensal', 'is_restaurant','is_staff','is_superuser')
    search_field = ["name","last_name"]
    list_filter = ['is_commensal', 'is_restaurant','is_staff','is_active']

admin.site.register(User, UserAdmin)