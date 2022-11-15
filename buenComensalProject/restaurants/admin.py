from tabnanny import verbose
from django.contrib import admin
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant


# Tabular para Restaurante
class ImagenRestaurantAdmin(admin.TabularInline):
    model = GalleryRestaurant

class TagsRestaurantAdmin(admin.TabularInline):
    model = TagsRestaurant

# Administración Etiquetas
class TagsAdmin(admin.ModelAdmin):
    list_display = ('id_tags', 'tags','restaurant_tags_id','restaurant_tags')

    def restaurant_tags_id(self, obj):
        return obj.restaurant_id
    
    restaurant_tags_id.short_description = "ID RESTAURANTE"

    def restaurant_tags(self, obj):
        return obj.restaurant
    
    restaurant_tags.short_description = "RESTAURANTE"

    
# Administración Imágenes
class ImagenAdmin(admin.ModelAdmin):
    list_display = ('id_imagen', 'imagen','restaurant_imagen_id','restaurant_imagen')

    def restaurant_imagen_id(self, obj):
        return obj.restaurant_id
    
    restaurant_imagen_id.short_description = "ID RESTAURANTE"

    def restaurant_imagen(self, obj):
        return obj.restaurant
    
    restaurant_imagen.short_description = "RESTAURANTE"

# Administración Restaurante
class RestaurantAdmin(admin.ModelAdmin):
    list_display = ('id_restaurant','user', 'new','environment','type_food','vegetarian','neighborhood', 'punctuation','schedule', 'prices')
    inlines = [
        ImagenRestaurantAdmin, TagsRestaurantAdmin
    ]

# Registros de admin

admin.site.register(Restaurant, RestaurantAdmin)

admin.site.register(GalleryRestaurant, ImagenAdmin)

admin.site.register(TagsRestaurant, TagsAdmin)
