# blog/forms.py

from django import forms
from .models import Image, Post, Comment, Page
from tinymce.widgets import TinyMCE

class TinyMCEWidget(TinyMCE):
    def use_required_attribute(self, *args):
        return False

class CommentForm(forms.Form):
    author = forms.CharField(
        max_length=60,
        widget=forms.TextInput(
            attrs={"class": "form-control", "placeholder": "Ваше ім'я"}
        ),
    )
    message = forms.CharField(
        widget=TinyMCEWidget( 
            attrs={'required': False, 'cols': 30, 'rows': 10, "placeholder": "Повідомлення"}
        ) 
    )

class ImageForm(forms.ModelForm):
    """Form for the image model"""
    class Meta:
        model = Image
        fields = ('title', 'slug', 'image')

class ThemeToogleBtn(forms.Form):
    theme = forms.CharField(
        widget=forms.HiddenInput()
    )