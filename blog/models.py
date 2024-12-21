from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from tinymce import models as tinymce_models

STATUS = (
    (0,"Чернетка"),
    (1,"Опубліковано")
)

class Category(models.Model):
    category_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30)

    class Meta:
        verbose_name_plural = "Розділ"

    def __str__(self):
        return self.name

class Post(models.Model):
    post_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200, unique=False)
    slug = models.SlugField(max_length=200, unique=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='author')
    content =  tinymce_models.HTMLField()
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now= True)
    category = models.ManyToManyField(Category, related_name="post_category")
    status = models.IntegerField(choices=STATUS, default=0)

    class Meta:
        ordering = ['-created_on']
        verbose_name_plural = "Допис"

    def get_absolute_url(self):
        return reverse("blog_detail", kwargs={"slug": str(self.slug)})
    
    def __str__(self):
        return self.title
    
class Page(models.Model):
    page_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200, unique=False)
    slug = models.SlugField(max_length=200, unique=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='author_page')
    content =  tinymce_models.HTMLField()
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now= True)
    status = models.IntegerField(choices=STATUS, default=0)

    class Meta:
        ordering = ['-created_on']
        verbose_name_plural = "Сторінка"

    def get_absolute_url(self):
        return reverse("page_detail", kwargs={"slug": str(self.slug)})
    
    def __str__(self):
        return self.title

class Comment(models.Model):
    comment_id = models.AutoField(primary_key=True)
    author = models.CharField(max_length=60)
    message = tinymce_models.HTMLField()
    created_on = models.DateTimeField(auto_now_add=True)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='post_comments')

    class Meta:
        ordering = ['-created_on']
        verbose_name_plural = "Коментар"

    def __str__(self):
        return f"{self.author} прокоментував '{self.post}'"
    
class Image(models.Model):
    title = models.CharField(max_length=200)
    image = models.ImageField(upload_to='images')
    
    def __str__(self):
        return self.title
    
    class Meta:
        ordering = ['-title']
        verbose_name_plural = "Зображення"