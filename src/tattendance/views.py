from django.shortcuts import render, redirect, reverse
from django.contrib.auth.decorators import login_required
from datetime import date, timedelta
from django.forms import modelformset_factory
from .models import TeacherAttendance
from .forms import TeacherAttendanceForm
from students.models import Student
from schools.models import School
from classes.models import Class
from teachers.models import Teacher
from django.contrib import messages
from django.db import connection #for custom sql
from django.db.models import *
#import datetime
from datetime import datetime, timedelta
from collections import OrderedDict
from django.utils import timezone
from dateutil.relativedelta import relativedelta
import json


def tattendance_affiliated_schools(request):
	#schools = School.objects.all()
    schools = {}  #by default, the dict of schools for tattendance should be empty
    #logic: if a superuser or manager is loggin on, they should see all schools. Otherwise, only if a user is a principal, they should see the schools they are affiliated with
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager':
        schools = School.objects.all()
    elif request.user.teacher.level == 'principal':
        schools = School.objects.filter(teacher__id = request.user.teacher.id)
    #test = request.user.teacher.pkss_school.all().values_list('id', flat=True) 
    test = 0
    context = {
        'affiliated_schools': schools, 
        'test': test, 
        } 
    return render(request, 'tattendance_affiliated schools.html', context)

# this helper function below is a custom func to convert the cursor object return to a dict
def dictfetchall(cursor):
	#Return all rows from a cursor as a dict
	columns = [col[0] for col in cursor.description]
	return [
		dict(zip(columns, row))
		for row in cursor.fetchall()
	]

def get_dates_range(start, end, delta):
    curr = start
    while curr < end:
        yield curr
        curr += delta

@login_required()
def tattendance_dates(request, school_id):    
    #five_days_back = date.today() - timedelta(2)
    #next_day = date.today() + timedelta(1)
    #dates_range = list(get_dates_range(five_days_back, next_day, timedelta(days=1)))
    cursor = connection.cursor()
    cursor.execute(
    '''SELECT i,
    COUNT (*) AS num_att,
    %s AS school_id
    FROM
    (select i::date from generate_series(Date(Now() -  Interval '3 day'), 
    Date(Now()), '1 day'::interval) i) AS A
    LEFT JOIN (SELECT X.*
    FROM tattendance_teacherattendance AS X
    WHERE school_id = %s) AS B ON A.i = B.attendance_date
    GROUP BY i 
    ORDER BY i DESC;''', [school_id, school_id])
    l1 = dictfetchall(cursor) #raw sql query get list of attedances entered by date
    
    #logic: only submit the request if superuser or a principal with access to a specific school
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager':
        sch = School.objects.get(pk=school_id)
    #elif request.user.teacher.level == 'principal' and school_id in test:
    elif request.user.teacher.level == 'principal' and request.user.teacher.pkss_school.filter(id=school_id).exists(): 
        sch = School.objects.get(pk=school_id)
    else:
        sch = {}
        school_id = {}

    #sch = School.objects.get(pk=school_id) #use this if no controls required and delete the if logic above
    context = {
		#'dates_range': dates_range,
        'l1': l1, 
		'school_id': school_id, 
		'sch': sch,
    } 
    return render(request, 'tattendance_dates.html', context)


@login_required()
def add_tattendance(request, school_id, date, readonly=False):
        school = School.objects.get(pk=school_id)

        #teacher_list = Teacher.objects.all()  # < filter this for just teachers in the school
        teacher_list = Teacher.objects.filter(pkss_school = school_id).filter(currently_active=True) #filter teachers for just those associated with the school
        teacher_list_initial = [{
                                'teacher': teacher,
                                'attendance_date': date,
                                'school': school
                                }
                                for teacher in teacher_list]

        tattendance_formset = modelformset_factory(TeacherAttendance, form=TeacherAttendanceForm,
                                                   extra=len(teacher_list),
                                                   max_num=len(teacher_list)
                                                   )

        formsets = tattendance_formset(initial=teacher_list_initial,
                                       queryset=TeacherAttendance.objects.filter(school=school, attendance_date=date, teacher__in=teacher_list)
                                       )

        #date = datetime.datetime.strptime(date, "%Y-%m-%d").date()
        date = datetime.strptime(date, "%Y-%m-%d").date()

        if request.method == 'POST':
            teacher_list = Teacher.objects.filter(pkss_school = school_id).filter(currently_active=True) #filter teachers for just those associated with the school
            tattendance_formset = modelformset_factory(TeacherAttendance, form=TeacherAttendanceForm,
                                                       extra=len(teacher_list),
                                                       max_num=len(teacher_list))

            formsets = tattendance_formset(request.POST)
            if formsets.is_valid():
                #formsets.save()  #use this for normal save. code below is to add in username
                for ins in formsets.save(commit=False):
                    ins.att_taker = request.user.username
                    ins.save()

                msg = 'Teacher Attendance submitted successfully for %s on %s' % (school.school_name, date.strftime("%b %d, %Y"))
                messages.success(request, msg)
                return redirect(reverse('tattendance_dates', kwargs={'school_id': school.pk}))
            else:
                print json.dumps(formsets.errors, indent=4)


        context = {
        'formset': formsets,
        'date': date,
        'school': school,
        'teacher_list': teacher_list
        }

        return render(request, 'teacher_attendance_formset.html', context)

@login_required()
def teacher_attendance_summary(request):
    cursor = connection.cursor()
    cursor.execute(
    '''SELECT school_name,
    CASE WHEN second_query.total_currentm >0 THEN second_query.present_currentm / CAST(second_query.total_currentm AS float) * 100 ELSE 0 END AS attendance_currentm,
    CASE WHEN second_query.total_minus1m > 0 THEN second_query.present_minus1m / CAST(second_query.total_minus1m AS float) * 100 ELSE 0 END AS attendance_minus1m,
    CASE WHEN second_query.total_minus2m > 0 THEN second_query.present_minus2m / CAST(second_query.total_minus2m AS float) * 100 ELSE 0 END AS attendance_minus2m,
    CASE WHEN second_query.total_minus3m > 0 THEN second_query.present_minus3m / CAST(second_query.total_minus3m AS float) * 100 ELSE 0 END AS attendance_minus3m,
    CASE WHEN second_query.total_minus4m > 0 THEN second_query.present_minus4m / CAST(second_query.total_minus4m AS float) * 100 ELSE 0 END AS attendance_minus4m,
    CASE WHEN second_query.total_minus5m > 0 THEN second_query.present_minus5m / CAST(second_query.total_minus5m AS float) * 100 ELSE 0 END AS attendance_minus5m
    FROM (SELECT school_name,
    COUNT(*) AS Num_records,
    SUM( CASE WHEN  status = 'present' THEN  1 ELSE 0 END) AS present_all_months,
    SUM( CASE WHEN  status = 'present' AND (Extract(month from lookup.attendance_date) = Extract(month from Now())) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now())) THEN  1 ELSE 0 END) AS present_currentm,
    SUM( CASE WHEN  Extract(month from lookup.attendance_date) = Extract(month from Now()) AND 
        (Extract(year from lookup.attendance_date) = Extract(year from Now())) THEN  1 ELSE 0 END) AS total_currentm,
    SUM( CASE WHEN  status = 'present' AND (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '1 month')) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '1 month')) THEN  1 ELSE 0 END) AS present_minus1m,
    SUM( CASE WHEN  (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '1 month')) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '1 month')) THEN  1 ELSE 0 END) AS total_minus1m,
    SUM( CASE WHEN  status = 'present' AND (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '2 month')) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '2 month')) THEN  1 ELSE 0 END) AS present_minus2m,
    SUM( CASE WHEN  (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '2 month')) AND 
        (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '2 month')) THEN  1 ELSE 0 END) AS total_minus2m,
    SUM( CASE WHEN  status = 'present' AND (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '3 month')) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '3 month')) THEN  1 ELSE 0 END) AS present_minus3m,
    SUM( CASE WHEN  (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '3 month')) AND 
        (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '3 month')) THEN  1 ELSE 0 END) AS total_minus3m,
    SUM( CASE WHEN  status = 'present' AND (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '4 month')) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '4 month')) THEN  1 ELSE 0 END) AS present_minus4m,
    SUM( CASE WHEN  (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '4 month')) AND 
        (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '4 month')) THEN  1 ELSE 0 END) AS total_minus4m,
    SUM( CASE WHEN  status = 'present' AND (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '5 month')) 
        AND (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '5 month')) THEN  1 ELSE 0 END) AS present_minus5m,
    SUM( CASE WHEN  (Extract(month from lookup.attendance_date) = Extract(month from Now() -  Interval '5 month')) AND 
        (Extract(year from lookup.attendance_date) = Extract(year from Now() -  Interval '5 month')) THEN  1 ELSE 0 END) AS total_minus5m
    FROM  (SELECT B.school_name, A.id, A.attendance_date, A.status 
    FROM tattendance_teacherattendance as A
    INNER JOIN schools_school AS B on A.school_id = B.id -- to bring in school name
    WHERE attendance_date > Date(Now() -  Interval '12 month') ) AS lookup
    GROUP BY school_name ) as second_query
    ORDER BY school_name;''', [])
    tattend = dictfetchall(cursor) #raw sql query to get 6 months of teacher attendance

    cursor.execute(
    '''SELECT 
    Extract(year from q1.attendance_date) AS year,
    Extract(month from q1.attendance_date) AS mth,
    COUNT(DISTINCT (q1.attendance_date)) AS days_att_entered,
    SUM( CASE WHEN  status = 'present' THEN 1 ELSE 0 END) AS present,
    count(*) AS count,
    SUM(CASE WHEN  status = 'present' THEN 1 ELSE 0 END)/ CAST(count(*) AS FLOAT) * 100 AS att_perc
    FROM
    (SELECT A.*
    FROM tattendance_teacherattendance AS A
    WHERE attendance_date > Date(Now() -  Interval '6 month') ) as q1
    GROUP BY year, mth
    ORDER BY year DESC, mth DESC;''', [])
    tattend_total = dictfetchall(cursor) #raw sql query to get the number of teacher shifts


    cursor.execute(
    '''SELECT school_name, teacher_id
    FROM (
    SELECT B.school_name, A.id, A.attendance_date, A.status, teacher_id 
    FROM tattendance_teacherattendance as A
    INNER JOIN schools_school AS B on A.school_id = B.id -- to bring in school name
    WHERE attendance_date > Date(Now() -  Interval '1 month') ) AS q1
    GROUP BY school_name, teacher_id;''', [])
    teacher_shifts = dictfetchall(cursor) #raw sql query to get the number of teacher shifts


    num_active_teachers = len(Teacher.objects.filter(currently_active=True)) #number of active teachers
    num_teacher_shifts = len(teacher_shifts)

    #calculate month names for the past 6 months
    m = datetime.today()
    m_minus1 = (datetime.now() - relativedelta(months=1))
    m_minus2 = (datetime.now() - relativedelta(months=2))
    m_minus3 = (datetime.now() - relativedelta(months=3))
    m_minus4 = (datetime.now() - relativedelta(months=4))
    m_minus5 = (datetime.now() - relativedelta(months=5))

    context = {
        #'dates_range': dates_range,
        'tattend': tattend,
        'tattend_total': tattend_total,
        "num_active_teachers": num_active_teachers,
        "num_teacher_shifts": num_teacher_shifts,
        "m": m,
        "m_minus1": m_minus1,
        "m_minus2": m_minus2,
        "m_minus3": m_minus3,
        "m_minus4": m_minus4,
        "m_minus5": m_minus5,
    } 
    return render(request, 'teacher_attendance_report.html', context) 

