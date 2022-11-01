from tabnanny import verbose
from django.contrib import admin
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant


# Register your models here.
class ImagenRestaurantAdmin(admin.TabularInline):
    model = GalleryRestaurant

class TagsRestaurantAdmin(admin.TabularInline):
    model = TagsRestaurant

class TagsAdmin(admin.ModelAdmin):
    list_display = ('id_tags', 'tags','restaurant_tags_id','restaurant_tags',)

    def restaurant_tags_id(self, obj):
        return obj.restaurant_id
    
    restaurant_tags_id.short_description = "ID RESTAURANTE"

    def restaurant_tags(self, obj):
        return obj.restaurant
    
    restaurant_tags.short_description = "RESTAURANTE"

    

class ImagenAdmin(admin.ModelAdmin):
    list_display = ('id_imagen', 'imagen','restaurant_imagen_id','restaurant_imagen')

    def restaurant_imagen_id(self, obj):
        return obj.restaurant_id
    
    restaurant_imagen_id.short_description = "ID RESTAURANTE"

    def restaurant_imagen(self, obj):
        return obj.restaurant
    
    restaurant_imagen.short_description = "RESTAURANTE"

class RestaurantAdmin(admin.ModelAdmin):
    list_display = ('id_restaurant','user', 'phone_number', 'address', 'neighborhood','date')
    inlines = [
        ImagenRestaurantAdmin, TagsRestaurantAdmin
    ]

admin.site.register(Restaurant, RestaurantAdmin)

admin.site.register(GalleryRestaurant, ImagenAdmin)

admin.site.register(TagsRestaurant, TagsAdmin)
