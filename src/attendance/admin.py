from django.contrib import admin

# Register your models here.
from .models import Attendance 


class AttendanceModelAdmin(admin.ModelAdmin):

	list_display = ['pk', 'get_school', 'get_class', 'attendance_date','student', 'datestamp', 'status', 'notes']
	list_display_links = ['pk', 'student','attendance_date', 'datestamp', 'status', 'notes']
	search_fields = ['attendance_date', 'datestamp', 'status']
	list_filter = ['attendance_date', 'datestamp', 'status']
	
	class Meta:
		model = Attendance

	def get_school(self, obj): #to pull in foreign key
		return obj.student.pkss_school
	get_school.short_description = 'School Name'  #Renames column header
	
	def get_class(self, obj): #to pull in foreign key
		return obj.student.pkss_class
	get_school.short_description = 'Class'  #Renames column header

admin.site.register(Attendance, AttendanceModelAdmin) 

