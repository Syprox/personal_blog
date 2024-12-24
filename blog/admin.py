from django.contrib import admin
from blog.models import Category, Comment, Post, Page, Image

class CategoryAdmin(admin.ModelAdmin):
    pass

class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'status','created_on')
    list_filter = ("status",)
    search_fields = ['title', 'content']


class PageAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'status','created_on')
    list_filter = ("status",)
    search_fields = ['title', 'content']

class ImageAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'created_on')
    search_fields = ['title', 'slug', 'category']

class CommentAdmin(admin.ModelAdmin):
    pass

admin.site.register(Category, CategoryAdmin)
"""  """
admin.site.register(Post, PostAdmin)
"""  """
admin.site.register(Comment, CommentAdmin)
"""  """
admin.site.register(Page, PageAdmin)
"""  """
admin.site.register(Image, ImageAdmin)
"""  """