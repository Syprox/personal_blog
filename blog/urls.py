from django.urls import path
from . import views
from django.urls import include
from django.contrib.sitemaps.views import sitemap
from blog.sitemaps import PostSitemap

sitemaps = {
    "posts": PostSitemap,
}

urlpatterns = [
    path("sitemap.xml", sitemap, {"sitemaps": sitemaps}, name="sitemap"),
    path("", views.blog_index, name="blog_index"),
    path("post/<slug>/", views.blog_detail, name="blog_detail"),
    path("page/<slug>/", views.page_detail, name="page_detail"),
    path("category/<category>/", views.blog_category, name="blog_category"),
    path('tinymce/', include('tinymce.urls')),
    path('upload/', views.image_upload_view, name="image_upload")
]