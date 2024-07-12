from datetime import timedelta
from django.conf import settings
from django.utils.deprecation import MiddlewareMixin
from .models import Complaints

class KeepSignedInMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        
        # Check if the checkbox value is '1' (checked) or None (not checked)
        keep_signed_in = request.POST.get('keep_signed_in')
        if keep_signed_in == '1':
            # If the user is authenticated and the checkbox is checked
            if request.user.is_authenticated:
                # Extend session expiry to the configured persistent duration
                request.session.set_expiry(settings.KEEP_SIGNED_IN_EXPIRY)
                
                # Set a cookie to remember the user's choice
                expires = settings.KEEP_SIGNED_IN_EXPIRY
                response.set_cookie('keep_signed_in', value='true', expires=expires)
        
        return response



class NewComplaintsMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        newcom_count = Complaints.objects.filter(status='0').count()
        request.newcom_count = newcom_count
        response = self.get_response(request)
        return response
