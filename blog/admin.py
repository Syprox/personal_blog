from django.contrib import admin
from blog.models import *

class CategoryAdmin(admin.ModelAdmin):
    pass

class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'status','created_on')
    list_filter = ("status",)
    search_fields = ['title', 'content']
    prepopulated_fields = {"slug": ["title",]}


class PageAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'status','created_on')
    list_filter = ("status",)
    search_fields = ['title', 'content']

class ImageAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'created_on')
    search_fields = ['title', 'slug', 'category']

class CommentAdmin(admin.ModelAdmin):
    pass

class ImageDBAdmin(admin.ModelAdmin):
    list_display = ('title', 'gd_id', 'added_on')
    search_fields = ['title', 'gd_id']

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
admin.site.register(ImageDB, ImageDBAdmin)
"""  """