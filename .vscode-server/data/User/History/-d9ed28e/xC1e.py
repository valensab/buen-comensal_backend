from django.contrib import admin
from users.models import User, Commensal
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    list_display = ('id','name','last_name','email','is_active','is_commensal', 'is_restaurant','is_staff','is_superuser')
    search_field = ["name","last_name", "email"]
    list_filter = ['is_commensal', 'is_restaurant','is_staff','is_active']

class CommensalAdmin(admin.ModelAdmin):
     list_display = ('id_commensal','user')

admin.site.register(User, UserAdmin)
admin.site.register(Commensal, CommensalAdmin)


