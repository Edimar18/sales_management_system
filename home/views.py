from django.shortcuts import render, redirect
from django.db import connection
from .models import Products
from django.urls import reverse
from django.contrib.auth import logout
# Create your views here.
def home(request):
    # Convert to dictionary list
    products = Products.objects.all()
    print(request.session.get('user_id'))
    return render(request,'index.html' , {'products':products}) 

def about(request):
    return render(request,'about.html')

def Logout(request):
    logout(request)
    return redirect(reverse('Login'))

def ProductsPage(request, pk):
    products = Products.objects.get(productid=pk)
    return render(request, 'products.html', {'products':products})