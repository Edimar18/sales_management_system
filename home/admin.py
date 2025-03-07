from django.contrib import admin
from .models import Products, Users, Orderdetails, Transactions, Orders
# Register your models here.
admin.site.register(Products)
admin.site.register(Users)
admin.site.register(Orderdetails)  # Register Orderdetails model
admin.site.register(Transactions)
admin.site.register(Orders)