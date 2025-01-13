# blog/forms.py

from django import forms
from .models import *
from tinymce.widgets import TinyMCE

class TinyMCEWidget(TinyMCE):
    def use_required_attribute(self, *args):
        return False

class CommentForm(forms.Form):
    author = forms.CharField(
        max_length=60,
        widget=forms.TextInput(
            attrs={'required': True, "class": "comment_author", "placeholder": "Ваше ім'я"}
        ),
    )
    message = forms.CharField(
        widget=forms.Textarea( 
            attrs={'required': True, 'cols': 70, 'rows': 8,"class": "comment_message", "placeholder": "Повідомлення"}
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