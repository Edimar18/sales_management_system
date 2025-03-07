from django.shortcuts import render
from django.db import connection
from .models import Products
# Create your views here.
def home(request):
    # Convert to dictionary list
    products = Products.objects.all()
    return render(request,'index.html' , {'products':products}) 

def about(request):
    return render(request,'about.html')