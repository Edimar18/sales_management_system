from django.urls import path
from .views import home, about, Logout
urlpatterns = [
    path('',home, name='Home'),
    path('about/', about, name='About'),
    path('logout/', Logout, name='Logout'),
]
