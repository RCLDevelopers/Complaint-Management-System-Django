from django.shortcuts import render,redirect,HttpResponse
from django.contrib.auth.decorators import login_required

from cmsapp.models import CustomUser,UserReg,Category,Subcategory,State,Complaints,ComplaintRemark
from django.contrib import messages
from django.http import JsonResponse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import random

@login_required(login_url='/')

def USERHOME(request):
    user_admin = request.user
    user_reg = UserReg.objects.get(admin=user_admin)
    complaints_count = Complaints.objects.filter(userregid=user_reg).count
    newcom_count = Complaints.objects.filter(status='0',userregid=user_reg).count()
    ipcom_count = Complaints.objects.filter(status='Inprocess',userregid=user_reg).count()
    closed_count = Complaints.objects.filter(status='Closed',userregid=user_reg).count()
    context = {
    'complaints_count':complaints_count,
    'newcom_count':newcom_count,
    'ipcom_count':ipcom_count,
    'closed_count':closed_count,        
    }
    return render(request,'user/userdashboard.html',context)

def USERSIGNUP(request):
   
    if request.method == "POST":
        pic = request.FILES.get('pic')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        email = request.POST.get('email')
        mobno = request.POST.get('mobno')        
        password = request.POST.get('password')

        if CustomUser.objects.filter(email=email).exists():
            messages.warning(request,'Email already exist')
            return redirect('usersignup')
        if CustomUser.objects.filter(username=username).exists():
            messages.warning(request,'Username already exist')
            return redirect('usersignup')
        else:
            user = CustomUser(
               first_name=first_name,
               last_name=last_name,
               username=username,
               email=email,
               user_type=2,
               profile_pic = pic,
            )
            user.set_password(password)
            user.save()            
            comuser = UserReg(
                admin = user,                
                mobilenumber = mobno,              
                
            )
            comuser.save()            
            messages.success(request,'Signup Successfully')
            return redirect('usersignup')
    
    

    return render(request,'user/user_reg.html')



@login_required(login_url='/')

def get_subcat(request):
    if request.method == 'GET':
        c_id = request.GET.get('c_id')
        subcat = Subcategory.objects.filter(cat_id=c_id)
        subcat_options = ''
        for subcategory in subcat:
            subcat_options += f'<option value="{subcategory.id}">{subcategory.subcatname}</option>'
        return JsonResponse({'subcat_options': subcat_options})
@login_required(login_url='/')
def REGCOMPLAINT(request):
    category = Category.objects.all()
    state = State.objects.all()
    if request.method == "POST":
        cat_id = request.POST.get('cat_id')
        subcategory_id_value = request.POST.get('subcategory_id')
        complaint_number = random.randint(100000000, 999999999)
        complainttype = request.POST.get('complainttype')
        stateid = request.POST.get('stateid')
        noc = request.POST.get('noc')
        complaindetails = request.POST.get('complaindetails')
        compfile = request.FILES.get('compfile')

        cid = Category.objects.get(id=cat_id)
        subcategory_id = Subcategory.objects.get(id=subcategory_id_value)
        stateid_obj = State.objects.get(id=stateid)

        # Accessing the UserReg instance associated with the logged-in user
        userreg = request.user.userreg

        complaint = Complaints(
            cat_id=cid,
            subcategory_id=subcategory_id,
            complaint_number=complaint_number,
            complainttype=complainttype,
            stateid=stateid_obj,
            noc=noc,
            complaindetails=complaindetails,
            compfile=compfile,
            userregid=userreg  # Assigning the UserReg instance to userregid field
        )
        complaint.save()

        messages.success(request, 'Complaint Lodged Successfully!!!')
        return redirect("regcomplaint")
    context = {
        'category': category,
        'state': state,
    }    

    return render(request, 'user/register-complaint.html', context)



@login_required(login_url='/')
def COMPLAINTHISTORY(request):
    userreg = request.user.userreg
    complaint_list = Complaints.objects.filter(userregid=userreg)
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
    return render(request, 'user/complaint-history.html', context)

@login_required(login_url='/')
def COMPLAINTHISTORYDETAILS(request,id):
    complaints = Complaints.objects.get(id=id)
    complaintsremarks = ComplaintRemark.objects.filter(comp_id_id=id)
      
    context = {
         'complaints':complaints,
         'complaintsremarks':complaintsremarks,
    }
    return render(request,'user/complaint-details.html',context)
