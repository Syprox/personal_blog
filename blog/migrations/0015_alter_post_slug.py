# Generated by Django 4.2 on 2024-12-24 07:31

import autoslug.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0014_alter_comment_message_alter_page_content_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=autoslug.fields.AutoSlugField(editable=False, populate_from='title', unique=True, verbose_name='Посилання'),
        ),
    ]
