from django.contrib import admin
from suggestions.models import Score, Comments
# Register your models here.
class ScroreAdmin(admin.ModelAdmin):
     list_display = ('id_user','id_restaurant','punctuation')

     def id_user(self, obj):
        return obj.id_user.user

class CommentsAdmin(admin.ModelAdmin):
     list_display = ('id_user','id_restaurant','comment')

admin.site.register(Score, ScroreAdmin)
admin.site.register(Comments, CommentsAdmin)