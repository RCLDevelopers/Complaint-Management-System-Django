from django.shortcuts import render,redirect,HttpResponse
from django.contrib.auth.decorators import login_required
from cmsapp.models import Category,Subcategory,State,Complaints,ComplaintRemark,UserReg
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime

@login_required(login_url='/')
def ADMINHOME(request):
    complaints = Complaints.objects.all()
    user_count = UserReg.objects.all().count
    category_count = Category.objects.all().count
    subcategory_count = Subcategory.objects.all().count
    state_count = State.objects.all().count    
    complaints_count = Complaints.objects.all().count
    newcom_count = Complaints.objects.filter(status='0').count()
    ipcom_count = Complaints.objects.filter(status='Inprocess').count()
    closed_count = Complaints.objects.filter(status='Closed').count()
    context = {'user_count':user_count,
    'category_count': category_count,
    'subcategory_count':subcategory_count,
    'state_count':state_count,
    'complaints_count':complaints_count,
    'newcom_count':newcom_count,
    'ipcom_count':ipcom_count,
    'closed_count':closed_count,
    'complaints':complaints        
    }
    return render(request,'admin/admindashboard.html',context)




@login_required(login_url='/')
def ADD_CATEGORY(request):
    if request.method == "POST":
        catname = request.POST.get('catname')
        catdes = request.POST.get('catdes')
        cat =Category(
            catname=catname,
            catdes=catdes,
        )
        cat.save()
        messages.success(request,'Category has been added succeesfully!!!')
        return redirect("add_category")
    return render(request,'admin/add_category.html')

@login_required(login_url='/')
def MANAGE_CATEGORY(request):
    cat_list = Category.objects.all()
    paginator = Paginator(cat_list, 10)  # Show 10 categories per page

    page_number = request.GET.get('page')
    try:
        categories = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        categories = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        categories = paginator.page(paginator.num_pages)

    context = {'categories': categories}
    return render(request, 'admin/manage_category.html', context)
@login_required(login_url='/')
def DELETE_CATEGORY(request,id):
    cat = Category.objects.get(id=id)
    cat.delete()
    messages.success(request,'Record Delete Succeesfully!!!')
    
    return redirect('manage_category')

login_required(login_url='/')
def UPDATE_CATEGORY(request,id):
    category = Category.objects.get(id=id)
    
    context = {
         'category':category,
    }

    return render(request,'admin/update_category.html',context)

login_required(login_url='/')

def UPDATE_CATEGORY_DETAILS(request):
        if request.method == 'POST':
          cat_id = request.POST.get('cat_id')
          catname = request.POST.get('catname')
          catdes = request.POST.get('catdes')
          category = Category.objects.get(id=cat_id) 
          category.catname = catname
          category.catdes = catdes
          category.save()   
          messages.success(request,"Your category detail has been updated successfully")
          return redirect('manage_category')
        return render(request, 'admin/update_category.html')

@login_required(login_url = '/')
def ADD_SUBCATEGORY(request):
    category = Category.objects.all()
    if request.method == "POST":
        cat_id = request.POST.get('cat_id')
        subcatname = request.POST.get('subcatname')
        cid = Category.objects.get(id=cat_id)
        Subcat = Subcategory(cat_id=cid, subcatname = subcatname,
        )
        Subcat.save()
        messages.success(request, 'Subcategory Added Succeesfully!!!')
        return redirect("add_subcategory")
    context = {
        'category':category
    }
    return render(request,'admin/add_subcategory.html',context)

def MANAGE_SUBCATEGORY(request):
    subcategory_list = Subcategory.objects.all()
    paginator = Paginator(subcategory_list, 10)  # Show 10 subcategories per page

    page_number = request.GET.get('page')
    try:
        subcategories = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        subcategories = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        subcategories = paginator.page(paginator.num_pages)

    context = {'subcategories': subcategories}
    return render(request, 'admin/manage_subcategory.html', context)

@login_required(login_url='/')
def DELETE_SUBCATEGORY(request,id):
    subcategory = Subcategory.objects.get(id=id)
    subcategory.delete()
    messages.success(request,'Record Delete Succeesfully!!!')
    
    return redirect('manage_subcategory')


login_required(login_url='/')
def UPDATE_SUBCATEGORY(request,id):
    category = Category.objects.all()
    subcategory = Subcategory.objects.get(id=id)
    
    context = {
         'subcategory':subcategory,
         'category':category,
    }

    return render(request,'admin/update_subcategory.html',context)


login_required(login_url='/')

def UPDATE_SUBCATEGORY_DETAILS(request):
        if request.method == 'POST':
          subcat_id = request.POST.get('subcat_id')
          cat_id = request.POST.get('cat_id')
          subcatname = request.POST.get('subcatname')
          subcategory = Subcategory.objects.get(id=subcat_id) 
          categoryid = Category.objects.get(id=cat_id) 
          subcategory.cat_id = categoryid
          subcategory.subcatname = subcatname
          subcategory.save()   
          messages.success(request,"Your subcategory detail has been updated successfully")
          return redirect('manage_subcategory')
        return render(request, 'admin/update_subcategory.html')

@login_required(login_url='/')
def ADD_STATE(request):
    if request.method == "POST":
        statename = request.POST.get('statename')
        
        state =State(
            statename=statename,
            
        )
        state.save()
        messages.success(request,'State has been added succeesfully!!!')
        return redirect("add_state")
    return render(request,'admin/add_state.html')

@login_required(login_url='/')
def MANAGE_STATE(request):
    state_list = State.objects.all()
    paginator = Paginator(state_list, 4)  # Show 4 states per page

    page_number = request.GET.get('page')
    try:
        states = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        states = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        states = paginator.page(paginator.num_pages)

    context = {'states': states}
    return render(request, 'admin/manage_state.html', context)

@login_required(login_url='/')
def MANAGEUSERS(request):
    user_list = UserReg.objects.all()
    paginator = Paginator(user_list, 4)  # Show 4 states per page

    page_number = request.GET.get('page')
    try:
        userlist = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        userlist = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        userlist = paginator.page(paginator.num_pages)

    context = {'userlist': userlist}
    return render(request, 'admin/manage_userlist.html', context)

login_required(login_url='/')
def VIEWUSERS(request,id):
    listedusers = UserReg.objects.get(id=id)
    
    context = {
         'listedusers':listedusers,
    }

    return render(request,'admin/view_users_details.html',context)

login_required(login_url='/')
def DELETEUSERS(request,id):
    delusers = UserReg.objects.get(id=id)
    delusers.delete()
    messages.success(request,'Record Delete Succeesfully!!!')

    return redirect('manageusers')



@login_required(login_url='/')
def USERSCOMPLAINTS(request, id):
    complaints=Complaints.objects.filter(userregid=id)
    context = {'complaints':complaints}
    return render(request, 'admin/user-lodged-complaints.html', context)


@login_required(login_url='/')
def DELETE_STATE(request,id):
    state = State.objects.get(id=id)
    state.delete()
    messages.success(request,'Record Delete Succeesfully!!!')
    
    return redirect('manage_state')


login_required(login_url='/')
def UPDATE_STATE(request,id):
    state = State.objects.get(id=id)
    
    context = {
         'state':state,
    }

    return render(request,'admin/update_state.html',context)

login_required(login_url='/')

def UPDATE_STATE_DETAILS(request):
        if request.method == 'POST':
          state_id = request.POST.get('state_id')
          statename = request.POST.get('statename')
          
          state = State.objects.get(id=state_id) 
          state.statename = statename
          
          state.save()   
          messages.success(request,"Your state detail has been updated successfully")
          return redirect('manage_state')
        return render(request, 'admin/update_state.html')


@login_required(login_url='/')
def LODGEDCOMPLAINTS(request):
    complaint_list = Complaints.objects.all()
    paginator = Paginator(complaint_list, 10)  # Show 10 complaints per page

    page_number = request.GET.get('page')
    try:
        complaints = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        complaints = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        complaints = paginator.page(paginator.num_pages)

    context = {'complaints': complaints}
    return render(request, 'admin/lodged-complaints.html', context)

@login_required(login_url='/')
def VIEWLODGEDCOMPLAINTS(request,id):
    complaints = Complaints.objects.filter(id=id)
    complaintsremarks = ComplaintRemark.objects.filter(comp_id_id=id)
      
    context = {
         'complaints':complaints,
         'complaintsremarks':complaintsremarks,
    }
    return render(request,'admin/view-lodged-complaints.html',context)

def LODGEDCOMPLAINTSREMARK(request):
    if request.method == 'POST':
        complaint_id = request.POST.get('comp_id')
        remark_text = request.POST.get('remark')
        status = request.POST.get('status')
        
        # Update the Complaints model
        lodged_complaint = Complaints.objects.get(id=complaint_id)
        lodged_complaint.remark = remark_text
        lodged_complaint.status = status
        lodged_complaint.save()
        
        # Create a new ComplaintRemark entry
        new_remark = ComplaintRemark.objects.create(
            comp_id_id=lodged_complaint,  # Pass the Complaints instance here
            remark=remark_text,
            status=status,
            remarkdate=timezone.now()
        )
        
        messages.success(request, "Status updated successfully")
        return redirect('lodgedcomplaint')
    else:
        # Handle the GET request if needed
        complaint_id = request.GET.get('comp_id')
        if complaint_id:
            lodged_complaint = get_object_or_404(Complaints, id=complaint_id)
            remarks = ComplaintRemark.objects.filter(comp_id_id=lodged_complaint)
            context = {'complaint': lodged_complaint, 'remarks': remarks}
        else:
            context = {}
             
    return render(request, 'admin/lodged-complaints.html', context)





def NEWCOMPLAINTS(request):    
    new_complaints = Complaints.objects.filter(status='0')
    context = {'new_complaints': new_complaints}
    return render(request, 'admin/new-complaints.html', context)

def INPROCESSCOMPLAINTS(request):    
    inprocess_complaints = Complaints.objects.filter(status='Inprocess')
    context = {'inprocess_complaints': inprocess_complaints}
    return render(request, 'admin/inprocess_complaints.html', context)

def CLOSEDCOMPLAINTS(request):    
    closed_complaints = Complaints.objects.filter(status='Closed')
    context = {'closed_complaints': closed_complaints}
    return render(request, 'admin/closed_complaints.html', context)


def COMPLAINTSREPORT(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    lodgedcomplaints = []

    if start_date and end_date:
        # Validate the date inputs
        try:
            start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
            end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
        except ValueError:
            return render(request, 'admin/complaint-between-date-report.html', {'lodgedcomplaints': lodgedcomplaints, 'error_message': 'Invalid date format'})

        # Filter visitors between the given date range
        lodgedcomplaints = Complaints.objects.filter(complaintdate_at__range=(start_date, end_date))

    return render(request, 'admin/complaint-between-date-report.html', {'lodgedcomplaints': lodgedcomplaints,'start_date':start_date,'end_date':end_date})


def USERBDREPORT(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    userdetails = []

    if start_date and end_date:
        # Validate the date inputs
        try:
            start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
            end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
        except ValueError:
            return render(request, 'admin/user-between-date-report.html', {'userdetails': userdetails, 'error_message': 'Invalid date format'})

        # Filter visitors between the given date range
        userdetails = UserReg.objects.filter(regdate_at__range=(start_date, end_date))

    return render(request, 'admin/user-between-date-report.html', {'userdetails': userdetails,'start_date':start_date,'end_date':end_date})


def Search_Complaints(request):
    if request.method == "GET":
        query = request.GET.get('query', '')
        if query:
            # Filter records where email or mobilenumber contains the query
            searchcomp = Complaints.objects.filter(complaint_number__icontains=query) | Complaints.objects.filter(userregid__mobilenumber__icontains=query)
            messages.info(request, "Search against " + query)
            return render(request, 'admin/search-complaints.html', {'searchcomp': searchcomp, 'query': query})
        else:
            print("No Record Found")
            return render(request, 'admin/search-complaints.html', {})

def Search_Users(request):
    if request.method == "GET":
        query = request.GET.get('query', '')
        if query:
            # Filter records where email or mobilenumber contains the query
            searchusers = UserReg.objects.filter(admin__email__icontains=query) |  UserReg.objects.filter(mobilenumber__icontains=query)| UserReg.objects.filter(admin__first_name__icontains=query)| UserReg.objects.filter(admin__last_name__icontains=query)
            
           
            messages.info(request, "Search against " + query)
            return render(request, 'admin/search-users.html', {'searchusers': searchusers, 'query': query})
        else:
            print("No Record Found")
            return render(request, 'admin/search-users.html', {})