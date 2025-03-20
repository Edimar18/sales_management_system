from django.urls import path
from .views import home, about, Logout, ProductsPage, purchase_history
urlpatterns = [
    path('',home, name='Home'),
    path('about/', about, name='About'),
    path('logout/', Logout, name='Logout'),
    path('purchase_history/', purchase_history, name='History'),
    path('products/<int:pk>', ProductsPage, name='Products') 
]
