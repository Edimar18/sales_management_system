from django.shortcuts import render, redirect
from django.http import HttpResponse
from home.models import Users
from django.contrib import messages
from django.contrib.auth import login
from django.urls import reverse
from django.contrib.sessions.backends.db import SessionStore
# Create your views here.

def login_view(request):
    if request.method == 'POST':
        type = request.POST.get('type')
        if type == 'login':
            email = request.POST.get('email')
            password = request.POST.get('password')
            
            if Users.objects.filter(email=email, password=password).exists():
                messages.success(request, ('Logged in successfully'))
                print('user exist')
                request.session['user_id'] = Users.objects.get(email=email, password=password).userid
                return redirect('/home')
            else:
                print('user does not exist')
                messages.error(request, ('Invalid credentials'))
        elif type == 'register':
            name = request.POST.get('name')
            email = request.POST.get('email')
            role = request.POST.get('role')
            password = request.POST.get('password')
            if Users.objects.filter(email=email, password=password).exists():
                messages.error(request, ('Email already exists'))
            else:
                
                user = Users.objects.create(name=name, email=email, role=role, password=password)
                user.save()
                print('user created')
                messages.success(request, ('User created successfully'))
                
    return render(request,'login.html')