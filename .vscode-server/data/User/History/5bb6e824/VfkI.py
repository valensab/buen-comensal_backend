from django.contrib import admin
from restaurants.models import Restaurant, GalleryRestaurant

# Register your models here.
class ImagenRestaurantAdmin(admin.TabularInline):
    model = GalleryRestaurant

class ImagenAdmin(admin.ModelAdmin):
    inlines = [
        ImagenRestaurantAdmin
    ]

admin.site.register(Restaurant, ImagenAdmin)

admin.site.register(GalleryRestaurant)
