from django.shortcuts import render, get_object_or_404, redirect, reverse
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db.models import Count, Sum, Avg, Max, Min,Q
from schools.models import School
from classes.models import Class
from django.db import connection  #for custom SQL 
# Create your views here.
from .models import Student, StudentHistory
from .forms import StudentForm, StudentUnenrollForm
from attendance.models import AttendanceCalendar, NonScheduledHolidays
from schools.models import School
from attendance.forms import AddAttCalDateForm, AddUnexpectedHolidayForm
from datetime import datetime, timedelta
from django.contrib import messages
from dateutil.relativedelta import relativedelta


@login_required 
def search_students(request):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator':
		queryset_list = Student.objects.all()
		query = request.GET.get("q1")
		#schools =School.objects.filter(teacher__id = request.user.teacher.id) #get schools assoc with user
		#schools = School.objects.all()
		if query:
			queryset_list = queryset_list.filter(
							Q(first_name__icontains=query) | Q(last_name__icontains=query) | Q(registration_number__icontains=query)
							)
			#if princ or teacher, filter queryset for just their school students
			if request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher':
				schools =School.objects.filter(teacher__id = request.user.teacher.id) #get schools assoc with user
				queryset_list = queryset_list.filter(pkss_school__in = schools) #filter for just that schools subset
				#schools = School.objects.filter(teacher__id = request.user.teacher.id) #get schools associc with princ or teacher
		num_students = len(queryset_list)	
		context = {
		"queryset_list":queryset_list,
		"num_students":num_students,
		"query": query,
		}

		return render(request, "student_list.html", context)

#view profile details for a student 
@login_required 
def student_profile_details(request, pk=None):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator':
		std = get_object_or_404(Student, pk=pk) #student object
		s_hist = StudentHistory.objects.filter(student_name_id = std.pk)
		#sch = School.objects.get(id = std.pkss_school_id) #school of object
		context = {
		"std": std,  #update this
		"s_hist": s_hist,
		}
		return render(request, "student_profile_details.html", context) 


#edit an existing student record
@login_required
def edit_student_record(request, pk=None):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator':
		std = get_object_or_404(Student, pk=pk)
		#form = StudentForm(request.POST or None, request.FILES or None, instance=std)
		form = StudentForm(request.POST or None, instance=std)
		if form.is_valid():
			try:
				instance = form.save(commit=False)
				curr_user = request.user.username
				instance.updated_last_by = curr_user
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
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'coordinator':
		std = get_object_or_404(Student, pk=pk)
		form = StudentUnenrollForm(request.POST or None, request.FILES or None, instance=std)
		if form.is_valid():
			try:
				instance = form.save(commit=False)
				curr_user = request.user.username
				instance.updated_last_by = curr_user
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
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'coordinator':
		form = StudentForm(request.POST or None, request.FILES or None)
		if form.is_valid():
			try:
				instance = form.save(commit=False)
				curr_user = request.user.username
				instance.updated_last_by = curr_user
				instance.save()

				#return HttpResponseRedirect( instance.get_absolute_url() )
				#<a href='{% url "std_profile" pk=obj.pk %}'>
				return HttpResponseRedirect( reverse('std_profile', kwargs={'pk': instance.pk}))
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
	if year_filter is None:
		year_filter = datetime.now().year

	cursor = connection.cursor()

	cursor.execute(
	'''SELECT school_name, school_id,
	COUNT(first_day_of_month) AS num_instances,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 1 THEN  workdays_in_month ELSE 0 END) AS jan,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 2 THEN  workdays_in_month ELSE 0 END) AS feb,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 3 THEN  workdays_in_month ELSE 0 END) AS march,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 4 THEN  workdays_in_month ELSE 0 END) AS april,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 5 THEN  workdays_in_month ELSE 0 END) AS may,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 6 THEN  workdays_in_month ELSE 0 END) AS june,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 7 THEN  workdays_in_month ELSE 0 END) AS july,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 8 THEN  workdays_in_month ELSE 0 END) AS aug,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 9 THEN  workdays_in_month ELSE 0 END) AS sep,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 10 THEN  workdays_in_month ELSE 0 END) AS oct,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 11 THEN  workdays_in_month ELSE 0 END) AS nov,
	SUM( CASE WHEN Extract(month from first_day_of_month)  = 12 THEN  workdays_in_month ELSE 0 END) AS dec
	FROM schools_school as A
	INNER JOIN attendance_attendancecalendar as B ON A.id = B.school_id
	WHERE Extract(year from first_day_of_month) =  %s 
	GROUP BY school_name, school_id
	ORDER BY school_name''', [year_filter])

	queryset = dictfetchall(cursor)
		
	context = {
		"queryset": queryset,
		"year_filter": year_filter,
	}
	return render(request, "school_attendance_calendar.html", context) 

#Add a cal date
@login_required
def add_a_cal_date(request):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'coordinator':
		
		"""
		view all of the working days in a year by school + add dates
		"""	
		year_filter = request.GET.get("q1")
		if year_filter is None:
			year_filter = datetime.now().year

		cursor = connection.cursor()

		cursor.execute(
		'''SELECT school_name, school_id,
		COUNT(first_day_of_month) AS num_instances,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 1 THEN  workdays_in_month ELSE 0 END) AS jan,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 2 THEN  workdays_in_month ELSE 0 END) AS feb,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 3 THEN  workdays_in_month ELSE 0 END) AS march,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 4 THEN  workdays_in_month ELSE 0 END) AS april,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 5 THEN  workdays_in_month ELSE 0 END) AS may,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 6 THEN  workdays_in_month ELSE 0 END) AS june,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 7 THEN  workdays_in_month ELSE 0 END) AS july,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 8 THEN  workdays_in_month ELSE 0 END) AS aug,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 9 THEN  workdays_in_month ELSE 0 END) AS sep,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 10 THEN  workdays_in_month ELSE 0 END) AS oct,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 11 THEN  workdays_in_month ELSE 0 END) AS nov,
		SUM( CASE WHEN Extract(month from first_day_of_month)  = 12 THEN  workdays_in_month ELSE 0 END) AS dec
		FROM schools_school as A
		INNER JOIN attendance_attendancecalendar as B ON A.id = B.school_id
		WHERE Extract(year from first_day_of_month) =  %s 
		GROUP BY school_name, school_id
		ORDER BY school_name''', [year_filter])

		queryset = dictfetchall(cursor)
			
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
			"queryset": queryset,
			"year_filter": year_filter,
		}
		return render(request, "add_cal_date.html", context)


#edit an existing calendar record
@login_required
def edit_school_caldate(request, pk=None, month=None):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'coordinator':
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
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'coordinator':
		form = AddUnexpectedHolidayForm(request.POST or None, request.FILES or None)
		if form.is_valid():
			try:
				instance = form.save(commit=False)
				#instance.master = Master.objects.get(pk=pk)
				instance.save()

				messages.success(request, 'Holiday submitted successfully')
				return HttpResponseRedirect( reverse('user_homepage'))
			except:
				return HttpResponseRedirect('/')
		context = {
			"form": form,
		}
		return render(request, "add_unexp_holiday.html", context)

#unexpected holiday report
@login_required
def view_unexpected_holidays_tot(request):
	"""
		view all of the unexpected holidays by school over last 12 months
	"""	
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator' or request.user.useraccess.access_level == 'accountant':
		cursor = connection.cursor()

		cursor.execute(
		'''SELECT q1.school_name, q1.school_id,
		COUNT (q1.holiday_date) AS Total_holidays,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() )) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() )) THEN  1 ELSE 0 END) AS present_m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '1 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '1 month')) THEN  1 ELSE 0 END) AS present_minus1m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '2 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '2 month')) THEN  1 ELSE 0 END) AS present_minus2m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '3 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '3 month')) THEN  1 ELSE 0 END) AS present_minus3m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '4 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '4 month')) THEN  1 ELSE 0 END) AS present_minus4m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '5 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '5 month')) THEN  1 ELSE 0 END) AS present_minus5m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '6 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '6 month')) THEN  1 ELSE 0 END) AS present_minus6m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '7 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '7 month')) THEN  1 ELSE 0 END) AS present_minus7m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '8 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '8 month')) THEN  1 ELSE 0 END) AS present_minus8m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '9 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '9 month')) THEN  1 ELSE 0 END) AS present_minus9m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '10 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '10 month')) THEN  1 ELSE 0 END) AS present_minus10m,
		SUM (CASE WHEN (Extract(month from q1.holiday_date) = Extract(month from Now() -  Interval '11 month')) 
			AND (Extract(year from q1.holiday_date) = Extract(year from Now() -  Interval '11 month')) THEN  1 ELSE 0 END) AS present_minus11m
		FROM 
		(SELECT A.*, school_name
		FROM attendance_nonscheduledholidays AS A
		INNER JOIN schools_school AS B ON A.school_id = B.id
		WHERE holiday_date > Date(Now() -  Interval '12 month')) as q1
		GROUP BY q1.school_name, q1.school_id 
		ORDER BY q1.school_name;''', [])

		queryset = dictfetchall(cursor)
		
		m = datetime.today()
		m_minus1 = (datetime.now() - relativedelta(months=1))
		m_minus2 = (datetime.now() - relativedelta(months=2))
		m_minus3 = (datetime.now() - relativedelta(months=3))
		m_minus4 = (datetime.now() - relativedelta(months=4))
		m_minus5 = (datetime.now() - relativedelta(months=5))
		m_minus6 = (datetime.now() - relativedelta(months=6))
		m_minus7 = (datetime.now() - relativedelta(months=7))
		m_minus8 = (datetime.now() - relativedelta(months=8))
		m_minus9 = (datetime.now() - relativedelta(months=9))
		m_minus10 = (datetime.now() - relativedelta(months=10))
		m_minus11 = (datetime.now() - relativedelta(months=11))


		context = {
			"queryset": queryset,
			"m": m,
			"m_minus1": m_minus1,
			"m_minus2": m_minus2,
			"m_minus3": m_minus3,
			"m_minus4": m_minus4,
			"m_minus5": m_minus5,
			"m_minus6": m_minus6,
			"m_minus7": m_minus7,
			"m_minus8": m_minus8,
			"m_minus9": m_minus9,
			"m_minus10": m_minus10,
			"m_minus11": m_minus11,
		}
		return render(request, "school_unexpected_holidays.html", context) 


#school deails for unexpected holiday
@login_required
def unexpected_holidays_deepdive(request, pk=None):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator' or request.user.useraccess.access_level == 'accountant':
		queryset = NonScheduledHolidays.objects.filter(school_id = pk).order_by('-holiday_date')
		sch = School.objects.get(pk=pk)
		context = {
		"queryset": queryset,
		"sch": sch,
		}
		return render(request, "unexpected_holidays_deepdive.html", context)



#view students who enrolled or left in a given period
@login_required 
def view_student_enrollments_and_leaving(request):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator' or request.user.useraccess.access_level == 'accountant': 
		#donations_list = Donor_log.objects.filter(donation_date__lt ='1990-01-01') 
		context = {}
		pk_sch = request.GET.get("q0")
		start = request.GET.get("q1")
		end = request.GET.get("q2")
		 
		if start is not None:	
			stds_joined = Student.objects.filter( Q(pkss_school__school_name__icontains=pk_sch)).\
				filter(date_joined__gte =start).filter(date_joined__lte =end).order_by('-date_joined')
			stds_left = Student.objects.filter( Q(pkss_school__school_name__icontains=pk_sch)).\
				filter(date_left__gte =start).filter(date_left__lte =end).order_by('-date_left')

			#for princip and teachers - filter to just their schools
			if request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher':
				schools =School.objects.filter(teacher__id = request.user.teacher.id)
				stds_joined = stds_joined.filter(pkss_school__in = schools) #filter for just that schools subset
				stds_left = stds_left.filter(pkss_school__in = schools) #filter for just that schools subset
			tot_students_active = Student.objects.filter( Q(pkss_school__school_name__icontains=pk_sch)).filter(currently_enrolled =True)
			tot_students_active = len(tot_students_active)
			num_joined = len(stds_joined)
			num_left = len(stds_left)
			net_joined = num_joined - num_left

			context = {
			"tot_students_active": tot_students_active,
			"stds_joined": stds_joined,
			"stds_left": stds_left,
			"start": start,
			"end": end,
			"pk_sch": pk_sch,
			"num_joined": num_joined,
			"num_left": num_left,
			"net_joined": net_joined,
			}

		return render(request, "net_enrollments.html", context) 

