

from django.contrib.auth.forms import UserCreationForm as AuthUserCreationForm
from django.contrib.auth.models import User
from django import forms


class UserCreationForm(AuthUserCreationForm):

    email = forms.EmailField()
    first_name = forms.CharField(max_length=30)
    last_name = forms.CharField(max_length=30)
    represented_school = forms.CharField(max_length=100)
    number_of_hackathons = forms.CharField(max_length=30)
    shirt_size = forms.CharField(max_length=30)
    dietary_restrictions = forms.CharField(max_length=254)
    personal_interests = forms.CharField(max_length=254)

    class Meta:
        model = User
        fields = ("username", "email", "first_name", "last_name")
