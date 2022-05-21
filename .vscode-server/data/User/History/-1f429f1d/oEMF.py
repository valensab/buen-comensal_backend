from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin

# Create your models here.



class User(Abstractser, PermissionsMixin):
    is_active = models.BooleanField("Activo", default = True)
    is_staff = models.BooleanField("Staff", default = False)
    is_restaurant = models.BooleanField("Restaurante", default = False)
    is_commensal = models.BooleanField("Comensal",default = False)
    is_superuser = models.BooleanField("Superuser", default = False)
    objects = UserManager()

    class Meta:
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
        
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name','last_name']

    def __str__(self):
        return f'{self.name} {self.last_name}'