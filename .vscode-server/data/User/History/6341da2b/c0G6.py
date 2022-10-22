from django.contrib import admin
from suggestions.models import Score, Comments
# Register your models here.
class ScroreAdmin(admin.ModelAdmin):
     list_display = ('commensal','restaurant','punctuation', 'comment')

     def commensal(self, obj):
        return obj.id_user.name + ' ' + obj.id_user.last_name

     def restaurant(self, obj):
          return obj.id_restaurant.user.name

class CommentsAdmin(admin.ModelAdmin):
     list_display = ('commensal','restaurant','comment')
     
     def commensal(self, obj):
       return obj.id_user.name + ' ' + obj.id_user.last_name
        
     def restaurant(self, obj):
          return obj.id_restaurant.user.name


admin.site.register(Score, ScroreAdmin)
admin.site.register(Comments, CommentsAdmin)