from django.contrib import admin

# Register your models here.
from .models import Attendance, AttendanceCalendar, NonScheduledHolidays


class AttendanceModelAdmin(admin.ModelAdmin):

	list_display = ['pk', 'get_school','get_class', 'attendance_date','student', 'datestamp', 'status', 'notes', 'att_taker']
	list_display_links = ['pk', 'student','attendance_date', 'datestamp', 'status', 'notes','att_taker']
	search_fields = ['attendance_date', 'datestamp', 'status']
	list_filter = ['attendance_date', 'datestamp', 'status', 'att_taker', 'student__pkss_school', 'student__pkss_class__shift']
	
	class Meta:
		model = Attendance
	
	def get_school(self, obj): #to pull in foreign key
		return obj.student.pkss_school
	get_school.short_description = 'School Name'  #Renames column header

	def get_class(self, obj): #to pull in foreign key
		return obj.student.pkss_class
	get_class.short_description = 'Class'  #Renames column header


admin.site.register(Attendance, AttendanceModelAdmin) 


class AttendanceCalendarAdmin(admin.ModelAdmin):
	list_display = ['pk','school','first_day_of_month','workdays_in_month','non_weekend_workdays_off']
	list_display_links = ['pk','school','first_day_of_month','workdays_in_month','non_weekend_workdays_off']
	search_fields = ['school','first_day_of_month']
	list_filter = ['school','first_day_of_month']
	class Meta:
		model = AttendanceCalendar

admin.site.register(AttendanceCalendar, AttendanceCalendarAdmin) 


class NonScheduledHolidaysAdmin(admin.ModelAdmin):
	list_display = ['pk','school','holiday_date', 'reason_for_holiday']
	list_display_links = ['pk','school','holiday_date', 'reason_for_holiday']
	search_fields = ['school']
	list_filter = ['school']
	class Meta:
		model = NonScheduledHolidays

admin.site.register(NonScheduledHolidays, NonScheduledHolidaysAdmin) 
