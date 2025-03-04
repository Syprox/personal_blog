'''
Django settings for personal_blog project.

Generated by 'django-admin startproject' using Django 5.0.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
'''

from pathlib import Path
import os

try:
    from dotenv import load_dotenv
    load_dotenv() # Завантаження змінних з .env файлу
    prod = False
except:
    prod = True


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
if prod:
    DEBUG = False
else:
    if os.environ.get('DEBUG') == 'True' or os.environ.get('DEBUG') == True:
        DEBUG = True
    else:
        DEBUG = False

ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS').split(',')

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
    'pwa',
    'compressor',
    'tinymce',
    'django.contrib.sitemaps',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

ROOT_URLCONF = 'personal_blog.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates',],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'personal_blog.wsgi.application'

# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get('DATABASE_NAME'),
        'HOST': os.environ.get('DATABASE_HOST'),
        'USER': os.environ.get('DATABASE_USER'),
        'PASSWORD': os.environ.get('DATABASE_PASSWORD'),
        'PORT': '3306',
        'OPTIONS': {
            'init_command': 'SET sql_mode="STRICT_TRANS_TABLES"',
        }
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'uk-UA'

TIME_ZONE = 'Europe/Kyiv'

USE_I18N = True

USE_TZ = True

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = 'static/'
STATICFILES_DIRS = [BASE_DIR / 'static', ]
STATIC_ROOT  = BASE_DIR / 'staticfiles'

if DEBUG == False:
    MEDIA_ROOT = 'home/syprox20/media.syprox.pp.ua/'
    MEDIA_URL = 'https://media.syprox.pp.ua/'
else:
    MEDIA_ROOT = BASE_DIR / 'media'
    MEDIA_URL = '/media/'

STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'compressor.finders.CompressorFinder'
]

TINYMCE_COMPRESSOR = False

TINYMCE_DEFAULT_CONFIG = {
    'height': 720,
    'width': 1200,
    'cleanup_on_startup': True,
    'custom_undo_redo_levels': 50,
    'relative_urls': False,
    "entity_encoding": "raw",
    "quickbars_insert_toolbar": False,
    'plugins':
            ' advlist textcolor save link image media preview codesample contextmenu\
            table code lists fullscreen insertdatetime nonbreaking\
            contextmenu directionality searchreplace wordcount visualblocks\
            visualchars code fullscreen autolink lists charmap print hr\
            anchor pagebreak',
    'toolbar1': ' blocks | alignnone alignleft alignright aligncenter alignjustify | bold italic underline strikethrough blockquote| bullist numlist table |\
            | link image media codesample | charmap hr nonbreaking anchor | ',
    'toolbar2': 'fullscreen preview | visualblocks visualchars | code | pastetext | removeformat |',
    'contextmenu': 'formats | link image',
    'menubar': True,
    'statusbar': True,
    }

#site.webmanifest налаштування початок
PWA_APP_NAME = 'CBC - Самопис'
PWA_APP_DESCRIPTION = "Самопис викладача мистецьких дисциплін"
PWA_APP_THEME_COLOR = '#3d1e67'
PWA_APP_BACKGROUND_COLOR = '#fcfcfc'
PWA_APP_DISPLAY = 'standalone'
PWA_APP_SCOPE = '/'
PWA_APP_ORIENTATION = 'any'
PWA_APP_START_URL = '/'
PWA_APP_STATUS_BAR_COLOR = 'default'
PWA_APP_ICONS = [
    {
        'src': '/static/img/favicon/my_app_icon.png',
        'sizes': '160x160'
    }
]
PWA_APP_ICONS_APPLE = [
    {
        'src': '/static/img/favicon/my_apple_icon.png',
        'sizes': '160x160'
    }
]
PWA_APP_SPLASH_SCREEN = [
    {
        'src': '/static/img/icons/splash-640x1136.png',
        'media': '(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)'
    }
]
PWA_APP_DIR = 'ltr'
PWA_APP_LANG = 'uk-UA'
PWA_APP_SHORTCUTS = [
    {
        'name': 'Shortcut',
        'url': '/target',
        'description': 'Shortcut to a page in my application'
    }
]
PWA_APP_SCREENSHOTS = [
    {
      'src': '/static/img/icons/splash-750x1334.png',
      'sizes': '750x1334',
      "type": "image/png"
    }
]
PWA_APP_DEBUG_MODE = False
#site.webmanifest налаштування кінець

COMPRESS_ENABLED = True
DEBUG_PROPAGATE_EXCEPTIONS = True