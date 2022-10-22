from django.contrib import admin
from qualifications.models import Score
# Register your models here.
class ScroreAdmin(admin.ModelAdmin):
     list_display = ('id_user','id_restaurant','comments')


admin.site.register(Score, ScroreAdmin)