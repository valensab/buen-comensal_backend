# Generated by Django 4.0.4 on 2022-10-25 22:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0012_alter_galleryrestaurant_restaurant'),
    ]

    operations = [
        migrations.AlterField(
            model_name='galleryrestaurant',
            name='restaurant',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='gallery', to='restaurants.restaurant'),
        ),
    ]