from django.contrib import admin
from restaurants.models import Restaurant, GalleryRestaurant, TagsRestaurant

# Register your models here.
class ImagenRestaurantAdmin(admin.TabularInline):
    model = GalleryRestaurant

class TagsRestaurantAdmin(admin.TabularInline):
    model = TagsRestaurant

class TagsAdmin(admin.ModelAdmin):
    list_display = ('restaurant_id','id_tags', 'tags')

class ImagenAdmin(admin.ModelAdmin):
    list_display = ('id_imagen', 'restaurant_id','imagen')

class RestaurantAdmin(admin.ModelAdmin):
    list_display = ('id_restaurant','user', 'phone_number', 'address', 'neighborhood','date')
    inlines = [
        ImagenRestaurantAdmin, TagsRestaurantAdmin
    ]

admin.site.register(Restaurant, RestaurantAdmin)

admin.site.register(GalleryRestaurant, ImagenAdmin)

admin.site.register(TagsRestaurant, TagsAdmin)