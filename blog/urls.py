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
    path("category/<slug>/", views.blog_index, name="blog_category"),
    path('upload/', views.image_upload_view, name="image_upload"),
    path("theme_toggle/", views.theme_toggle, name="theme_toggle"),
    path("search/<str:keyword>", views.search, name="search"),
]