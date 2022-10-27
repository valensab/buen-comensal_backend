from tabnanny import verbose
from django.contrib import admin
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant


# Register your models here.
class ImagenRestaurantAdmin(admin.TabularInline):
    model = GalleryRestaurant

class TagsRestaurantAdmin(admin.TabularInline):
    model = TagsRestaurant

class TagsAdmin(admin.ModelAdmin):
    list_display = ('restaurant','id_tags', 'tags')

    def restaurant(self, obj):
        return obj.id_restaurant.user.name

    restaurant.short_description = "RESTAURANTE"


class ImagenAdmin(admin.ModelAdmin):
    list_display = ('id_imagen', 'restaurant','imagen')

    def restaurant(self, obj):
        return obj.restaurant_id
    restaurant.short_description = "RESTAURANTE"

class RestaurantAdmin(admin.ModelAdmin):
    list_display = ('id_restaurant','user', 'phone_number', 'address', 'neighborhood','date')
    inlines = [
        ImagenRestaurantAdmin, TagsRestaurantAdmin
    ]

admin.site.register(Restaurant, RestaurantAdmin)

admin.site.register(GalleryRestaurant, ImagenAdmin)

admin.site.register(TagsRestaurant, TagsAdmin)
