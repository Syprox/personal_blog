# Generated by Django 4.2 on 2024-12-28 11:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0021_alter_post_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=models.SlugField(max_length=40, unique=True, verbose_name='Посилання'),
        ),
    ]