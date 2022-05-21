from django.db import models
from django.core.validators import FileExtensionValidator
from users.models import User

class Restaurant(models.Model):
    def nameFile(instance, filename):
     return '/'.join(['menus/', str(instance.name), filename])
    
    id_restaurant = models.AutoField(primary_key=True, unique = True)
    email = models.EmailField('Correo electrónico',max_length = 254, unique = True)
    name = models.CharField('Nombre del restaurante', max_length = 50, blank = True, null = True)
    name_representative = models.CharField('Nombre del representante', max_length = 50, blank = True, null = True)
    last_name_representative = models.CharField('Apellido del representante', max_length = 50, blank = True, null = True)
    phone_number= models.CharField("Número de teléfono del restaurante", max_length=10, null = True)
    password = models.CharField("Contraseña", max_length=254,null=True, blank=True, default = None)
    phone_number_representative = models.CharField("Número de teléfono del representante", max_length=10, null = True)
    address = models.CharField("Dirección", max_length=100, null = True)
    neighborhood = models.CharField("Barrio", max_length=100, null = True)
    description = models.CharField("Descripción", max_length=254, null = True)
    menu = models.FileField("Menú",upload_to=nameFile, blank=True,  null = True)
    prices = models.DecimalField('Precios', max_digits=10, decimal_places=3, blank = True, null = True)
    is_active = models.BooleanField("Activo", default = True)
    is_restaurant = models.BooleanField("Restaurante", default = False)

    class Meta:
        verbose_name = 'Restaurante'
        verbose_name_plural = 'Restaurantes'
        
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name']

    def __str__(self):
        return f'{self.name}'