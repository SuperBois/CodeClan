from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def home(request):
    return render(request, "myapp/Home.html")

def signup(request):
    return render(request, "myapp/SignUp.html")

def dashboard(request):
    return render(request, "myapp/Dashboard.html")