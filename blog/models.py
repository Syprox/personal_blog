from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from tinymce.models import HTMLField
from django.utils import timezone
from django.utils.text import slugify
import re

STATUS = (
    (0,"Чернетка"),
    (1,"Опубліковано")
)

class Category(models.Model):
    category_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, verbose_name="Назва")
    slug = models.SlugField(max_length=38, unique=True, verbose_name="Посилання")

    class Meta:
        verbose_name_plural = "Розділи"

    def __str__(self):
        return self.name

class Post(models.Model):
    post_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100, unique=False, verbose_name="Назва")
    slug = models.SlugField(max_length=108, unique=True, verbose_name="Посилання")
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='author',  verbose_name="Автор")
    content = HTMLField(verbose_name="Вміст допису")
    created_on = models.DateTimeField(default=timezone.now, verbose_name="Дата створення допису", editable=True)
    updated_on = models.DateTimeField(auto_now= True)
    category = models.ManyToManyField(Category, related_name="post_category",  verbose_name="Розділ")
    status = models.IntegerField(choices=STATUS, default=0, verbose_name="Стан допису")

    class Meta:
        ordering = ['-created_on']
        verbose_name_plural = "Дописи"

    def get_absolute_url(self):
        return reverse("blog_detail", kwargs={"slug": str(self.slug)})
    
    def __str__(self):
        return self.title
    
    def save(self, *args, **kwargs):
        if not re.search(r'[a-zA-Z0-9_-]-\d{2}-\d{4}$', self.slug):
            suffix = self.created_on.strftime('%m') + '-' + self.created_on.strftime('%Y')
            self.slug = slugify(self.slug) + "-" + suffix
        super(Post, self).save(*args, **kwargs)
        
    
class Page(models.Model):
    page_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100, unique=False, verbose_name="Назва")
    slug = models.SlugField(max_length=108, unique=True, verbose_name="Посилання")
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='author_page', verbose_name="Автор")
    content =  HTMLField(verbose_name="Вміст сторінки")
    created_on = models.DateTimeField(auto_now_add=True, verbose_name="Дата створення сторінки")
    updated_on = models.DateTimeField(auto_now= True)
    status = models.IntegerField(choices=STATUS, default=0, verbose_name="Стан сторінки")

    class Meta:
        ordering = ['-created_on']
        verbose_name_plural = "Сторінки"

    def get_absolute_url(self):
        return reverse("page_detail", kwargs={"slug": str(self.slug)})
    
    def __str__(self):
        return self.title

class Comment(models.Model):
    comment_id = models.AutoField(primary_key=True)
    author = models.CharField(max_length=60, verbose_name="Автор")
    message = models.TextField(max_length=300, verbose_name="Повідомлення")
    created_on = models.DateTimeField(auto_now_add=True, verbose_name="Дата створення коментаря")
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='post_comments', verbose_name="Допис")

    class Meta:
        ordering = ['-created_on']
        verbose_name_plural = "Коментарі"

    def __str__(self):
        return f"{self.author} прокоментував '{self.post}'"
    
class Image(models.Model):
    title = models.CharField(max_length=100, verbose_name="Назва")
    slug = models.SlugField(max_length=108, unique=True, verbose_name="Посилання",editable=True)
    created_on = models.DateTimeField(auto_now_add=True, null=True, verbose_name="Дата створення зображення")
    category = models.ManyToManyField(Category, related_name='category_image', verbose_name="Розділ")
    image = models.ImageField(upload_to='images', verbose_name="Зображення")

    
    def __str__(self):
        return self.title
    
    class Meta:
        ordering = ['-title']
        verbose_name_plural = "Зображення"