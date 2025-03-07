from django.shortcuts import redirect, render
from .models import Users
from django.urls import reverse

class AuthMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        allowed_paths = ["/login", "/register", '/']  # Allow login/register pages

        if request.path not in allowed_paths:
            user_id = request.session.get("user_id")
            if not user_id:
                return redirect(reverse("Login"))  # Redirect if not logged in
            
            user = Users.objects.get(userid=user_id)
            
    
        return self.get_response(request)
