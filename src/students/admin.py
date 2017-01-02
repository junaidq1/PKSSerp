from django.contrib import admin

# Register your models here.
from .models import Student


class StudentModelAdmin(admin.ModelAdmin):
	list_display = ['pk', 'first_name','last_name','gender','date_of_birth', 'contact_number', 'date_joined', 'pkss_school','pkss_class','actual_fee_paid']
	list_display_links = ['pk', 'first_name','last_name','gender','date_of_birth', 'contact_number', 'date_joined', 'pkss_school','pkss_class','actual_fee_paid']
	search_fields = ['first_name','last_name','gender','date_of_birth', 'contact_number', 'pkss_school','pkss_class','actual_fee_paid'] 
	list_filter = ['first_name','last_name','gender', 'pkss_school','pkss_class'] 
	class Meta:
		model = Student

admin.site.register(Student, StudentModelAdmin) 