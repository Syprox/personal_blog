# Generated by Django 4.2 on 2025-01-18 20:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0025_alter_page_created_on_imagedb'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagedb',
            name='gd_id',
            field=models.CharField(max_length=33, unique=True),
        ),
    ]
