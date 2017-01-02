from django.contrib import admin

# Register your models here.
from .models import Attendance 


class AttendanceModelAdmin(admin.ModelAdmin):
	list_display = ['pk', 'student','attendance_date', 'datestamp', 'status', 'notes']
	list_display_links = ['pk', 'student','attendance_date', 'datestamp', 'status', 'notes']
	search_fields = ['attendance_date', 'datestamp', 'status']
	list_filter = ['attendance_date', 'datestamp', 'status']
	class Meta:
		model = Attendance

admin.site.register(Attendance, AttendanceModelAdmin) 

