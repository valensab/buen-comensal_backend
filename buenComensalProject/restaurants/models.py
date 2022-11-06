from tabnanny import verbose
from django.db import models
from users.models import User
from taggit.managers import TaggableManager
from django.utils import timezone

# Modelo Restaurante
class Restaurant(models.Model):
    
    def nameFile(instance, filename):
     return '/'.join(['menus/', str(instance.user_id), filename])

    user = models.OneToOneField(User,related_name="restaurant",verbose_name= 'ID Usuario',on_delete=models.CASCADE)
    id_restaurant = models.AutoField(primary_key=True, verbose_name= 'ID Restaurante', unique = True)
    name_representative = models.CharField('Nombre del representante', max_length = 50, blank = True, null = True)
    last_name_representative = models.CharField('Apellido del representante', max_length = 50, blank = True, null = True)
    phone_number= models.CharField("Número de teléfono del restaurante", max_length=10, null = True)
    phone_number_representative = models.CharField("Número de teléfono del representante", max_length=10, null = True)
    address = models.CharField("Dirección", max_length=100, null = True)
    neighborhood = models.CharField("Barrio", max_length=100, null = True)
    description = models.CharField("Descripción", max_length=254, null = True)
    menu = models.FileField("Menú",upload_to=nameFile, blank=True,  null = True)
    prices = models.DecimalField('Precios', max_digits=10, decimal_places=3, blank = True, null = True)
    schedule = models.CharField('Horario de atención', max_length = 254, blank = True, null = True)
    active = models.BooleanField('Activo', default = False, editable=True)
    type_food = models.CharField('Tipo de comida', max_length = 255, blank = True, null = True)
    vegetarian = models.BooleanField('Vegetariano', default = False)
    environment = models.CharField('Ambiente', max_length=254, null = True, blank = True)
    new = models.BooleanField('Nuevo', default = False, editable=True)
    punctuation = models.IntegerField('Puntuación',null = True, blank = True, default = 0)
    date = models.DateField("Fecha de creación",auto_now_add=True, auto_now=False)

    class Meta:
        verbose_name = 'Restaurante'
        verbose_name_plural = 'Restaurantes'

    def __str__(self):
        return f'{self.user}'

# Modelo Imágenes
class GalleryRestaurant(models.Model):

    def nameImage(instance, filename):
     return '/'.join(['gallery/', str(instance.restaurant_id), filename])

    id_imagen = models.AutoField('ID Imagen',primary_key=True, unique = True)
    restaurant = models.ForeignKey(Restaurant, verbose_name='ID Restaurante',  on_delete=models.CASCADE, null=True,blank=True)
    imagen = models.ImageField('Imagen',upload_to=nameImage,blank=True,  null = True)

    class Meta:
        verbose_name = 'Galería'
        verbose_name_plural = 'Galerías'

# class TagsRestaurant(models.Model):
#     restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="tags")
#     id_tags =  models.AutoField(primary_key=True, unique = True)
#     tags = TaggableManager()

#     class Meta:
#         verbose_name = 'Etiqueta'
#         verbose_name_plural = 'Etiquetas'

# Modelo Etiquetas
class TagsRestaurant(models.Model):
    restaurant = models.ForeignKey(Restaurant,on_delete=models.CASCADE,related_name="tags")
    id_tags =  models.AutoField('ID Etiqueta', primary_key=True, unique = True)
    tags = models.CharField("Etiqueta", max_length=254, null = True, blank=True)
    
    def save(self, *args, **kwargs):
        self.tags = (self.tags).lower()
        return super(TagsRestaurant, self).save(*args, **kwargs)
        
    class Meta:
        verbose_name = 'Etiqueta'
        verbose_name_plural = 'Etiquetas'

    