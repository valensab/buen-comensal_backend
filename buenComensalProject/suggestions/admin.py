from django.contrib import admin
from suggestions.models import Score, Comments, Favorites

# Register your models here.
class ScroreAdmin(admin.ModelAdmin):
     list_display = ('id', 'id_commensal','commensal','restaurant_id','restaurant','punctuation', 'comment')

     def commensal(self, obj):

        return obj.id_user.name + ' ' + obj.id_user.last_name
     
     commensal.short_description = "COMENSAL"
     
     def id_commensal(self, obj): 
        return obj.id_user.id

     id_commensal.short_description = "ID COMENSAL"

     def restaurant(self, obj):
          return obj.id_restaurant.user.name
     
     restaurant.short_description = "RESTAURANTE"

     def restaurant_id(self, obj): 
        return obj.id_restaurant.id_restaurant

     restaurant_id.short_description = "ID RESTAURANTE"

class CommentsAdmin(admin.ModelAdmin):
     list_display = ('id', 'id_commensal','commensal','restaurant_id','restaurant','comment')
     
     def commensal(self, obj):
       return obj.id_user.name + ' ' + obj.id_user.last_name
     
     commensal.short_description = "COMENSAL"

     def id_commensal(self, obj): 
        return obj.id_user.id

     id_commensal.short_description = "ID COMENSAL"
        

     def restaurant_id(self, obj): 
        return obj.id_restaurant.id_restaurant

     restaurant_id.short_description = "ID RESTAURANTE"

     def restaurant(self, obj):
          return obj.id_restaurant.user.name

     restaurant.short_description = "RESTAURANTE"

class FavoritesAdmin(admin.ModelAdmin):
     list_display = ('id', 'id_commensal','commensal','restaurant_id','restaurant','favorite')
     
     def commensal(self, obj):
       return obj.id_user.name + ' ' + obj.id_user.last_name
     
     commensal.short_description = "COMENSAL"

     def id_commensal(self, obj): 
        return obj.id_user.id

     id_commensal.short_description = "ID COMENSAL"
        

     def restaurant_id(self, obj): 
        return obj.id_restaurant.id_restaurant

     restaurant_id.short_description = "ID RESTAURANTE"

     def restaurant(self, obj):
          return obj.id_restaurant.user.name

     restaurant.short_description = "RESTAURANTE"

admin.site.register(Score, ScroreAdmin)
admin.site.register(Comments, CommentsAdmin)
admin.site.register(Favorites, FavoritesAdmin)