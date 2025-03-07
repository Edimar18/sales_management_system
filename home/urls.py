from django.urls import path
from .views import home, about
urlpatterns = [
    path('',home, name='Home'),
    path('about/', about, name='About'),
]
