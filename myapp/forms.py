from django import forms
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User
from .models import *


class CreateUserForm(UserCreationForm):
    class Meta:
        model=User
        fields = ['first_name','last_name','username', 'email', 'password1', 'password2']

class CreateCourseForm(ModelForm):
    class Meta:
        model = Course
        fields = '__all__'
