from django.urls import path
from .views import home, about, Logout, ProductsPage
urlpatterns = [
    path('',home, name='Home'),
    path('about/', about, name='About'),
    path('logout/', Logout, name='Logout'),
    path('products/<int:pk>', ProductsPage, name='Products') 
]
