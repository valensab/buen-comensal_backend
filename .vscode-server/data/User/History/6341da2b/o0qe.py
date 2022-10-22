from django.contrib import admin
from suggestions.models import Score
# Register your models here.
class ScroreAdmin(admin.ModelAdmin):
     list_display = ('id_user','id_restaurant','punctuation')


admin.site.register(Score, ScroreAdmin)