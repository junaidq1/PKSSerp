
from django.shortcuts import render, get_object_or_404, redirect, reverse
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db.models import Count, Sum, Avg, Max, Min,Q
from schools.models import School
from classes.models import Class
from django.db import connection  #for custom SQL 
from datetime import datetime, timedelta
# Create your views here.

#from attendance.models import AttendanceCalendar, NonScheduledHolidays
from schools.models import School
from teachers.models import Teacher
from students.models import Student
#from attendance.forms import AddAttCalDateForm, AddUnexpectedHolidayForm


#school profile view
@login_required
def view_list_of_schools(request):
	sch_list = School.objects.all()

	context = {
	"sch_list": sch_list,
	} 
	return render(request, "list_of_schools.html", context) 

# this helper function below is a custom func to convert the cursor object return to a dict
def dictfetchall(cursor):
	#Return all rows from a cursor as a dict
	columns = [col[0] for col in cursor.description]
	return [
		dict(zip(columns, row))
		for row in cursor.fetchall()
	]

#school profile deepdive
@login_required
def school_profile_deepdive(request, pk=None):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'staff' or request.user.useraccess.access_level == 'coordinator':
		sch = get_object_or_404(School, pk=pk)
		teach = Teacher.objects.filter(pkss_school = pk).filter( ~Q(level ='management')) #the list of teachers associated with school excluding management
		num_teachers = len(teach) #the number of teachers associated with school	
		try:
			principal = teach.filter(level = 'principal')[0] #principal of school
		except:
			principal = "n/a"
		std = Student.objects.filter(pkss_school_id = pk).filter(currently_enrolled =True) #students at school
		num_students = len(std)
		num_boys = len(Student.objects.filter(pkss_school_id = pk).filter(currently_enrolled =True).filter(gender = 'male'))
		num_girls = len(Student.objects.filter(pkss_school_id = pk).filter(currently_enrolled =True).filter(gender = 'female'))

		std.extra(select={'std_tenure':  "DATE_PART('day', NOW() - date_joined) / 365.0"})
		#avg_tenure = std.aggregate(Avg('std_tenure'))	
		#time_worked = time_worked_aggregate[0]['elapsed'].total_seconds()

		cursor = connection.cursor()

		cursor.execute(
		'''SELECT q1.class_name,
		COUNT (DISTINCT(school_class_section)) AS sections,
		COUNT(*) AS num_students,
		SUM( CASE WHEN q1.gender = 'male' THEN 1 ELSE 0 END) as boys,
		SUM( CASE WHEN q1.gender = 'female' THEN 1 ELSE 0 END) as girls,
		AVG (q1.tenure) as avg_tenure
		FROM
		( SELECT *,
		DATE_PART('day', NOW() - date_joined) / 365.0 AS tenure
		FROM students_student AS A 
		INNER JOIN classes_class AS B ON A.pkss_class_id = B.id
		WHERE A.pkss_school_id = %s AND currently_enrolled IS TRUE ) AS q1
		GROUP BY class_name;''', [pk])

		queryset1 = dictfetchall(cursor) #raw sql query for students by class

		cursor.execute(
		'''SELECT 
		Extract(year from q1.attendance_date) AS year,
		Extract(month from q1.attendance_date) AS mth,
		COUNT(DISTINCT (q1.attendance_date)) AS days_att_entered,
		SUM( CASE WHEN  status = 'present' THEN 1 ELSE 0 END) AS present,
		COUNT(*) AS count,
		SUM(CASE WHEN  status = 'present' THEN 1 ELSE 0 END)/ CAST(COUNT(*) AS FLOAT) * 100 AS att_perc
		FROM
		(SELECT A.*, B.pkss_school_id
		FROM attendance_attendance AS A
		INNER JOIN students_student AS B ON A.student_id = B.id
		WHERE pkss_school_id = %s AND attendance_date > Date(Now() -  Interval '12 month') ) as q1
		GROUP BY year, mth
		ORDER BY year DESC, mth DESC''', [pk])

		queryset2 = dictfetchall(cursor) #raw sql query for attendance by month

		cursor.execute(
		'''SELECT q2.yr, q2.mth, q2.max_date, q2.school_id,
		COUNT(*) AS enrollment,
		SUM( CASE WHEN C.gender = 'male' THEN 1 ELSE 0 END) as enr_boys,
		SUM( CASE WHEN C.gender = 'female' THEN 1 ELSE 0 END) as enr_girls
		FROM
		( SELECT Extract(year from q1.attendance_date) AS yr,
		Extract(month from q1.attendance_date) AS mth,
		q1.pkss_school_id AS school_id,
		MAX(q1.attendance_date) AS max_date
		FROM (SELECT A.*, B.pkss_school_id
		FROM attendance_attendance AS A
		INNER JOIN students_student AS B ON A.student_id = B.id
		WHERE pkss_school_id = %s AND attendance_date > Date(Now() -  Interval '12 month')) AS q1 
		GROUP BY yr, mth, school_id
		ORDER BY yr DESC, mth DESC ) as q2
		INNER JOIN (SELECT * FROM attendance_attendance INNER JOIN students_student AS D 
			ON student_id = D.pkss_school_id) AS C ON (q2.max_date = C.attendance_date AND q2.school_id = C.pkss_school_id)
		WHERE school_id = %s
		GROUP BY q2.yr, q2.mth, q2.max_date, q2.school_id
		ORDER BY yr DESC, mth DESC;''', [pk, pk]) #end of month enrollment - last 12 months 

		queryset3 = dictfetchall(cursor) #end of month enrollment

		context = {
		"sch": sch,
		"principal": principal,
		"num_teachers": num_teachers,
		"num_students": num_students,
		"num_boys": num_boys,
		"num_girls": num_girls,
		#"avg_tenure": avg_tenure,
		"std": std,
		"queryset1": queryset1,
		"queryset2": queryset2,
		"queryset3": queryset3,
		} 
		
		return render (request, "school_profile_details.html", context)

@login_required
def student_list_school(request, pk=None):
	if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'staff' or request.user.useraccess.access_level == 'coordinator':
		sch = get_object_or_404(School, pk=pk)
		std = Student.objects.filter(pkss_school_id = pk).filter(currently_enrolled =True) #students at school
		
		context = {
		"sch": sch,
		"students": std,
		} 
		
		return render (request, "student_list_by_school.html", context)





	