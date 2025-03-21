from django.shortcuts import render, redirect
from django.db import connection
from .models import Products, Users, Orders, Orderdetails, Transactions
from django.urls import reverse
from django.contrib.auth import logout
from django.http import JsonResponse
import json, datetime
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

def checkout(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        product_id = data.get('productId')
        user_id = request.session.get('user_id')
        quantity = data.get('quantity')
        total_amount = Products.objects.get(productid=product_id).price * int(quantity)
        order_date = datetime.datetime.now()
        user = Users.objects.get(userid=user_id)
        
        try:
           order = Orders.objects.create(userid=user, totalamount=total_amount, orderdate=order_date)
           order.save()
           order_id = order.orderid
           product = Products.objects.get(productid=product_id)
           order_detail = Orderdetails.objects.create(orderid=order, productid=product, quantity=quantity, subtotal=total_amount)
           order_detail.save()
           transaction = Transactions.objects.create(orderid=order, paymentstatus='Completed', paymentdate=datetime.datetime.now())
           
           transaction.save()
           print('successfully created')
           return JsonResponse({'success': True})
        except Exception as e:
            print('Failed to create', e)
            return JsonResponse({'success': False, 'message': str(e)})

    return JsonResponse({'success': False, 'message': 'Invalid request method'})