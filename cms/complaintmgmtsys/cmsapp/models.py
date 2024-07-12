from django.db import models
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):
    USER ={
        (1,'admin'),
        (2,'compuser'),
        
    }
    user_type = models.CharField(choices=USER,max_length=50,default=1)

    profile_pic = models.ImageField(upload_to='media/profile_pic')


class Category(models.Model):
    catname = models.CharField(max_length=200)
    catdes = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.catname

class Subcategory(models.Model):
    cat_id = models.ForeignKey(Category, on_delete=models.CASCADE)
    subcatname = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.subcatname

class State(models.Model):
    statename = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.statename

class UserReg(models.Model):
    admin = models.OneToOneField(CustomUser, on_delete=models.CASCADE, null=True, blank=True)
    mobilenumber = models.CharField(max_length=11)
    regdate_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        if self.admin:
            return f"{self.admin.first_name} {self.admin.last_name} - {self.mobilenumber}"
        else:
            return f"User not associated - {self.mobilenumber}"

class Complaints(models.Model):
    userregid = models.ForeignKey(UserReg, on_delete=models.CASCADE, null=True, blank=True)
    cat_id = models.ForeignKey(Category, on_delete=models.CASCADE)
    subcategory_id = models.ForeignKey(Subcategory, on_delete=models.CASCADE)
    complaint_number = models.IntegerField(default=0)
    complainttype = models.CharField(max_length=250)
    stateid = models.ForeignKey(State, on_delete=models.CASCADE)
    noc = models.CharField(max_length=250)
    complaindetails = models.TextField(blank=True)
    compfile = models.ImageField(upload_to='media/doc_file')
    complaintdate_at = models.DateTimeField(auto_now_add=True)
    remark = models.TextField(blank=True)
    status = models.CharField(max_length=250,default=0)
    updated_at = models.DateTimeField(auto_now=True)

class ComplaintRemark(models.Model):
    comp_id_id = models.ForeignKey(Complaints, on_delete=models.CASCADE)
    remark = models.TextField(blank=True)
    status = models.CharField(max_length=250,default=0)
    remarkdate = models.DateTimeField(auto_now_add=True)



