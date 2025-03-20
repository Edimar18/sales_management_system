from django.shortcuts import render, redirect
from django.db import connection
from .models import Products, Users, Orders, Orderdetails, Transactions
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
def purchase_history(request):
    userId = request.session.get('user_id')
    user = Users.objects.get(userid=userId)
    order = Orders.objects.filter(userid=userId)
    order_details = {}
    for ord in order:
        orderid = ord.orderid
        order_date = ord.orderdate
        details = Orderdetails.objects.filter(orderid=orderid)
        for detail in details:
            price = Products.objects.get(productid=detail.productid.productid).price
            productname = Products.objects.get(productid=detail.productid.productid).name
            productimage = Products.objects.get(productid=detail.productid.productid).imageurl
            print(productimage)
            status = Transactions.objects.get(orderid=orderid).paymentstatus
            order_details[orderid] = {'order_date':order_date, 'price':price, 'productname':productname, 'productimage':productimage, 'status':status}
    '''
    
    to fetch:
    orderid - orders /
    orderdate - orders
    price - products
    status - transaction
    productname - products
    prudct image - products
    ''' 
    return render(request,'history.html', {'user':user, 'order_details':order_details})
def Logout(request):
    logout(request)
    return redirect(reverse('Login'))

def ProductsPage(request, pk):
    products = Products.objects.get(productid=pk)
    related_products = Products.objects.order_by('?')[:4]
    return render(request, 'products.html', {'products':products, 'related_products':related_products})