from django.shortcuts import render
from blog.models import *
from django.http import HttpResponseRedirect
from blog.forms import CommentForm
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from .forms import *
from . import forms as f
from . import util
from django.shortcuts import redirect
from bs4 import BeautifulSoup
from django.db.models import Q


def page_detail(request, slug):
    categories = Category.objects.get_queryset().order_by('name')
    page = Page.objects.get(slug=slug)
    context={
        'page': page,
        'categories': categories,
        "search_form": f.SearchForm,
    }
    return render(request, 'blog/page.html', context)

def blog_index(request, slug=None):
    query = ""
    category = False
    if request.GET.get("q", "") != "":
        query = request.GET.get("q")
        posts = Post.objects.filter(Q(title__icontains=query) | Q(content__icontains=query))
        print (len(posts))
    elif slug is not None:
        posts = Post.objects.filter(category__slug__icontains=slug, status=1).order_by("-created_on")
        category = Category.objects.get(slug=slug)
    else:
        posts = Post.objects.filter(status=1).order_by('-created_on')
        
    categories = Category.objects.get_queryset().order_by('name')

    posts_on_page = 3
    page_number = request.GET.get('page')
    post_in_current_page = get_posts_list(posts, page_number, posts_on_page)
    prev_images = []

    for post in post_in_current_page:
    
        post.content = content_handler(post.content, True)
    
        pc = BeautifulSoup(post.content, 'html.parser')
        
        try:
            first_image = pc.img.extract()
        except:
            first_image = '<span data-info="The post has no images"></span>'

        prev_images.append(first_image)

        ph = [tag for tag in pc.find_all() if tag.name in ['p']] #, 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'
        
        prev_len = 200
        text = ''
        l=0
        while len(text) < prev_len:
            text += ph[l].prettify(formatter="minimal")
            l+=1

        if len(text) == 0:
            post.content = '<p></p>'
        else:
            if len(text) > prev_len + 100:
                text = text[:prev_len + 100] + '...</>'
            post.content = text
    
    context = {'page': page_number,
                'category': category,
                'categories': categories,
                'posts': post_in_current_page,
                'posts_on_page': posts_on_page,
                'prev_images': prev_images,
                "search_form": f.SearchForm,
                }
    return render(request, 'blog/index.html', context)

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
    
    comments = Comment.objects.filter(post=post)

    content = content_handler(post.content, False)

    context = {
        "post": post,
        "content": content,
        "comments": comments,
        'categories': categories,
        "form": CommentForm(),
        "search_form": f.SearchForm,
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

def content_handler(content="",list=False):
    
    doc = BeautifulSoup(content, 'html.parser')
   # images handler start
    imgs_list = doc.find_all('img', attrs={'data-source': True})

    for img in imgs_list:
       
        img_origin = False
        try:
            if img['data-size'] == "":
                img_origin = img['data-origin']
        except:
            pass
        if img['alt'] == "":
            try:
                info = ImageDB.objects.get(gd_id = img['data-source'])
                img['alt'] = info.title
            except:
                pass
        image_source = img['data-source']
        clst = ' '.join(img.get('class', []))
       
        if list:
            image_size = 480
            img['class'] = re.sub(r'\b(left|right|center|full-width)\b','', clst)
            img['class'] = img.get('class', []) + 'left'
        elif img_origin:
            pass
        else:
            try:
                image_size = img['data-size']
            except:
                if not re.search(r'\bleft\b|\bright\b|\bfull-width\b|\bcenter\b', clst):
                    img['class'] = img.get('class', []) + 'center'
                try:
                    if "left" in img['class'] or "right" in img['class']:
                        image_size = 300
                    elif "full-width" in img['class']:
                        image_size = 1200
                    else:
                        image_size = 1200
                except:
                    image_size = 1200

        if img_origin:
            if img['data-origin'] == 'True':
                img['src'] = f'https://drive.google.com/thumbnail?id={image_source}'
        else:
            img['src'] = f'https://drive.google.com/thumbnail?id={image_source}&sz=w{image_size}'
        
        del img['data-source']
        del img['data-size']
        del img['data-origin']
    # images handler end

    return doc.prettify(formatter="minimal")

