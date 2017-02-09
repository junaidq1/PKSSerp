from django.contrib import admin

# Register your models here.
from .models import Student


class StudentModelAdmin(admin.ModelAdmin):
	list_display = ['pk','registration_number', 'first_name','last_name','gender','currently_enrolled', 'date_of_birth',  'date_joined', 'pkss_school','pkss_class','fee_concession_percent', 'updated_last_by', 'updated_last']
	list_display_links = ['pk', 'first_name','last_name','gender','date_of_birth', 'date_joined', 'pkss_school','pkss_class','fee_concession_percent']
	search_fields = ['first_name','last_name','gender','date_of_birth', 'contact_number', 'pkss_school','pkss_class','currently_enrolled'] 
	list_filter = ['gender', 'pkss_school','pkss_class', 'currently_enrolled'] 
	class Meta:
		model = Student

admin.site.register(Student, StudentModelAdmin) 