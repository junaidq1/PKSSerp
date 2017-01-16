from django.shortcuts import render
from django.shortcuts import render, get_object_or_404, redirect, reverse
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db.models import Count, Sum, Avg, Max, Min,Q
from schools.models import School
from classes.models import Class
from django.db import connection  #for custom SQL 
# Create your views here.
from .models import Student
from .forms import StudentForm, StudentUnenrollForm
from attendance.models import AttendanceCalendar
from attendance.forms import AddAttCalDateForm, AddUnexpectedHolidayForm
 
@login_required 
def search_students(request):
	queryset_list = Student.objects.all()
	query = request.GET.get("q1")
	if query:
		queryset_list = queryset_list.filter(
						Q(first_name__icontains=query) | Q(last_name__icontains=query)
						)
		#print queryset_list
	context = {
	"queryset_list":queryset_list,
	"query": query
	}

	return render(request, "student_list.html", context)
	#<a href='{% url "cont_detail" pk=obj.pk %}'> Select </a>

#view profile details for a student
@login_required 
def student_profile_details(request, pk=None):
	std = get_object_or_404(Student, pk=pk) #student object
	#sch = School.objects.get(id = std.pkss_school_id) #school of object
	#cls = Class.objects.get(id= std.pkss_class_id)  #class of student

	context = {
	"std": std,  #update this
	}
	return render(request, "student_profile_details.html", context)


#edit an existing student record
@login_required
def edit_student_record(request, pk=None):
	std = get_object_or_404(Student, pk=pk)
	form = StudentForm(request.POST or None, request.FILES or None, instance=std)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( instance.get_absolute_url() )
		except:
			return HttpResponseRedirect('/student_profile/%s' %(pk))
	context = {
		"form": form,
		"std": std,
	}
	return render(request, "edit_student_profile.html", context)


#unenroll student
@login_required
def unenroll_student(request, pk=None):
	std = get_object_or_404(Student, pk=pk)
	form = StudentUnenrollForm(request.POST or None, request.FILES or None, instance=std)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( instance.get_absolute_url() )
		except:
			return HttpResponseRedirect('/student_profile/%s' %(pk))
	context = {
		"form": form,
		"std": std,
	}
	return render(request, "unenroll_student.html", context)


#Add a student
@login_required
def add_a_student(request): 
	form = StudentForm(request.POST or None, request.FILES or None)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( instance.get_absolute_url() )
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
	}
	return render(request, "add_student.html", context)

# this helper function below is a custom func to convert the cursor object return to a dict
def dictfetchall(cursor):
	#Return all rows from a cursor as a dict
	columns = [col[0] for col in cursor.description]
	return [
		dict(zip(columns, row))
		for row in cursor.fetchall()
	]


@login_required
def view_attendance_calendar(request):
	"""
		view all of the working days in a year by school
	"""	
	year_filter = request.GET.get("q1")

	cursor = connection.cursor()

	cursor.execute(
	'''SELECT school_name, school_id,
	COUNT(first_day_of_month) AS num_instances,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '01' THEN  workdays_in_month ELSE 0 END) AS jan,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '02' THEN  workdays_in_month ELSE 0 END) AS feb,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '03' THEN  workdays_in_month ELSE 0 END) AS march,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '04' THEN  workdays_in_month ELSE 0 END) AS april,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '05' THEN  workdays_in_month ELSE 0 END) AS may,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '06' THEN  workdays_in_month ELSE 0 END) AS june,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '07' THEN  workdays_in_month ELSE 0 END) AS july,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '08' THEN  workdays_in_month ELSE 0 END) AS aug,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '09' THEN  workdays_in_month ELSE 0 END) AS sep,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '10' THEN  workdays_in_month ELSE 0 END) AS oct,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '11' THEN  workdays_in_month ELSE 0 END) AS nov,
	SUM( CASE WHEN strftime('%m', first_day_of_month) = '12' THEN  workdays_in_month ELSE 0 END) AS dec
	FROM schools_school as A
	INNER JOIN attendance_attendancecalendar as B ON A.id = B.school_id
	WHERE strftime('%Y', first_day_of_month) =  '2017' 
	GROUP BY school_name''', [])

	queryset = dictfetchall(cursor)
		
	context = {
		"queryset": queryset,
	}
	return render(request, "school_attendance_calendar.html", context) 

#Add a cal date 
@login_required
def add_a_cal_date(request): 
	form = AddAttCalDateForm(request.POST or None, request.FILES or None)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()
			return HttpResponseRedirect( reverse('attend_calendar'))
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
	}
	return render(request, "add_cal_date.html", context)


#edit an existing calendar record
@login_required
def edit_school_caldate(request, pk=None, month=None):
	try:
		inst = AttendanceCalendar.objects.filter(school_id=pk).filter(first_day_of_month__month = month)[0]
	except:
		return HttpResponseRedirect( reverse('add_cal_date')) #if error, then make user enter cal date
	#std = get_object_or_404(Student, pk=pk)
	form = AddAttCalDateForm(request.POST or None, request.FILES or None, instance=inst)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()

			return HttpResponseRedirect( reverse('attend_calendar') )
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
		"inst": inst,
	}
	return render(request, "edit_cal_date.html", context)


#Add an unexpected holiday 
@login_required
def add_unexpected_holiday(request): 
	form = AddUnexpectedHolidayForm(request.POST or None, request.FILES or None)
	if form.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()
			return HttpResponseRedirect( reverse('user_homepage'))
		except:
			return HttpResponseRedirect('/')
	context = {
		"form": form,
	}
	return render(request, "add_unexp_holiday.html", context)
