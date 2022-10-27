from django.contrib import admin
from users.models import User, Commensal
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    list_display = ('id','name','last_name','email','is_active','is_commensal', 'is_restaurant','is_staff','is_superuser')
    search_field = ["name","last_name", "email"]
    list_filter = ['is_commensal', 'is_restaurant','is_staff','is_active']

class CommensalAdmin(admin.ModelAdmin):
    list_display = ('id','commensal','new','interest','environment','vegetarian')
    
    def commensal(self, obj):
        return obj.user
     
    commensal.short_description = "COMENSAL"
    
    def id(self, obj):
        return obj.id_commensal
     
    id.short_description = "ID COMENSAL"
    
admin.site.register(User, UserAdmin)
admin.site.register(Commensal, CommensalAdmin)


