from django.shortcuts import render
from blog.models import *
from django.http import HttpResponseRedirect
from blog.forms import CommentForm
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from .forms import *
from . import forms as f
from django.shortcuts import redirect
from bs4 import BeautifulSoup

def page_detail(request, slug):
    page = Page.objects.get(slug=slug)
    return render(request, 'blog/page.html', {'page': page})

def blog_index(request, slug=None):
    
    category = False
    
    if slug is not None:
        posts = Post.objects.filter(category__slug__icontains=slug, status=1).order_by("-created_on")
        category = Category.objects.get(slug=slug)
    else:
        posts = Post.objects.filter(status=1).order_by('-created_on')
        
    categories = Category.objects.get_queryset().order_by('name')

    posts_on_page = 3
    page_number = request.GET.get('page')
    post_in_current_page = get_posts_list(posts, page_number, posts_on_page)

    for post in post_in_current_page:
        post.content = content_check(post.content)

    context = {'page': page_number,
                'category': category,
                'categories': categories,
                'posts': post_in_current_page,
                }
    return render(request,
                  'blog/index.html',
                  context)

def blog_detail(request, slug):
    categories = Category.objects.get_queryset().order_by('name')
    try:
        post = Post.objects.get(slug=slug)
    except Post.DoesNotExist:
        return blog_index(request)
    form = CommentForm()
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = Comment(
                author=form.cleaned_data["author"],
                message=form.cleaned_data["message"],
                post=post,
            )
            comment.save()
            return HttpResponseRedirect(request.path_info)
    print("Вибраний допис: " + str(post.post_id))
    comments = Comment.objects.filter(post=post)

    content = content_check(post.content)

    context = {
        "post": post,
        "content": content,
        "comments": comments,
        'categories': categories,
        "form": CommentForm(),
    }

    return render(request, "blog/detail.html", context)

def get_posts_list (posts, page_number, posts_on_page):
    pages = Paginator(posts, posts_on_page)
    
    try:
        posts_list = pages.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer deliver the first page
        posts_list = pages.page(1)
    except EmptyPage:
        # If page is out of range deliver last page of results
        posts_list = pages.page(pages.num_pages)

    return posts_list

def image_upload_view(request):
    """Process images uploaded by users"""
    if request.method == 'POST':
        form = ImageForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            # Get the current instance object to display in the template
            img_obj = form.instance
            return render(request, 'blog/image_upload.html', {'form': form, 'img_obj': img_obj})
    else:
        form = ImageForm()
        return render(request, 'blog/image_upload.html', {'form': form})
    
def theme_toggle(request):
    if 'theme' in request.session and request.session['theme'] == 'light':
        request.session['theme'] = 'dark' if request.session['theme'] == 'light' else 'light'
    else:
        request.session['theme'] = 'light'
    
    return redirect(request.META.get('HTTP_REFERER', '/'))

def content_check(content):

    doc = BeautifulSoup(content, 'html.parser')
    for img in doc.find_all('img', attrs={'data-source': True}):
        image_source = img['data-source']
        image_size = img['data-size']
        imageDB = ImageDB.objects.get(gd_id = image_source)
        img['src'] = f'https://drive.google.com/thumbnail?id={image_source}&sz=w{image_size}'
        del img['data-source']
        del img['data-size']

    return doc.prettify(formatter="minimal")