from django.contrib import admin

# Register your models here.
from .models import Student, StudentHistory


class StudentModelAdmin(admin.ModelAdmin):
	list_display = ['pk','registration_number', 'first_name','last_name','gender','currently_enrolled', 'date_of_birth',  'date_joined', 'pkss_school','pkss_class','fee_percent_rate_fixed', 'updated_last_by', 'updated_last']
	list_display_links = ['pk', 'first_name','last_name','gender','date_of_birth', 'date_joined', 'pkss_school','pkss_class','fee_percent_rate_fixed']
	search_fields = ['first_name','last_name','gender','date_of_birth', 'contact_number', 'pkss_school','pkss_class','currently_enrolled'] 
	list_filter = ['gender', 'pkss_school','pkss_class', 'currently_enrolled'] 
	class Meta:
		model = Student

admin.site.register(Student, StudentModelAdmin) 

class StudentHistoryAdmin(admin.ModelAdmin):
	list_display = ['pk','student_name','date','pkss_class','created']
	list_display_links = ['pk','student_name','date','pkss_class','created']
	list_filter = ['date', 'pkss_class'] 
	class Meta:
		model = StudentHistory

admin.site.register(StudentHistory, StudentHistoryAdmin) 
