from __future__ import division
from attendance.forms import AttendanceForm
from django.shortcuts import render, redirect, reverse
from django.contrib.auth.decorators import login_required
from students.models import Student
from schools.models import School
from datetime import date, timedelta
from django.forms import modelformset_factory
from attendance.models import Attendance, AttendanceCalendar
from classes.models import Class
from django.contrib import messages
from django.db import connection #for custom sql
from django.db.models import *
import datetime
from collections import OrderedDict
from django.utils import timezone
from dateutil.relativedelta import relativedelta
from django.shortcuts import HttpResponseRedirect
from django.http import JsonResponse
import json
import ast
import datetime


def go_home(request):
    if request.user.is_authenticated():
        return render(request, "home.html", {})
    else:
        return render(request, "home_not_loggedin.html", {})


def get_dates_range(start, end, delta):
    curr = start
    while curr < end:
        yield curr
        curr += delta


def affiliated_schools(request):
    #schools = School.objects.filter(teacher=request.user.teacher) #original
    #cls = Class.objects.filter(school_id__in = schools) #JQ: added #original
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'coordinator':
        schools = School.objects.all()
        cls = Class.objects.all()
    elif request.user.teacher.level == 'teacher' or request.user.teacher.level == 'principal':
        schools = School.objects.filter(teacher__id = request.user.teacher.id)
        cls = Class.objects.filter(school_id__in = schools)
    context = {
            'affiliated_schools': schools, 
            'cls': cls, 
            } 
    return render(request, 'affiliated_schools.html', context)

# this helper function below is a custom func to convert the cursor object return to a dict
def dictfetchall(cursor):
    #Return all rows from a cursor as a dict
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

@login_required()
#def attendance_dates(request, school_id):
def attendance_dates(request, school_id, shift):    
    five_days_back = date.today() - timedelta(5)
    next_day = date.today() + timedelta(1)
    dates_range = list(get_dates_range(five_days_back, next_day, timedelta(days=1)))

    cursor = connection.cursor()
    cursor.execute(
    '''SELECT i,
    COUNT (*) AS num_att,
    %s AS school_id
    FROM
    (select i::date from generate_series(Date(Now() -  Interval '2 day'),
      Date(Now()), '1 day'::interval) i) AS A
    LEFT JOIN (SELECT X.*, Y.pkss_school_id
    FROM attendance_attendance AS X
    INNER JOIN students_student AS Y ON X.student_id = Y.id
    INNER JOIN classes_class AS Z ON Y.pkss_class_id = Z.id
    WHERE pkss_school_id= %s AND Z.shift = %s) AS B ON A.i = B.attendance_date
    GROUP BY i 
    ORDER BY i DESC;''', [school_id, school_id, shift])

    l1 = dictfetchall(cursor) #raw sql query list of dates

    #logic: only submit the request if superuser or a principal with access to a specific school
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'coordinator':
        sch = School.objects.get(pk=school_id)
    #elif request.user.teacher.level == 'principal' and school_id in test:
    elif (request.user.teacher.level == 'principal' or request.user.teacher.level == 'teacher') and request.user.teacher.pkss_school.filter(id=school_id).exists(): 
        sch = School.objects.get(pk=school_id)
    else:
        sch = {}
        school_id = {}
        l1 = {}
    #sch = School.objects.get(pk=school_id) #original
    context = {
            'dates_range': dates_range, 
            'school_id': school_id,
            'l1': l1, 
            'sch': sch,
            'shift': shift,
            }
    return render(request, 'attendance_dates.html', context)


@login_required()
def add_attendance2(request, school_id, date, shift, readonly=False):
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator':
        
        #the code below is to ensure that people dont game the system (enter att for old dates) via url. Note: check does not apply to superuser
        if request.user.useraccess.access_level != 'super':
            date_d = datetime.datetime.strptime(date, "%Y-%m-%d").date() #convert date string to date object
            three_days_back = date_d.today() - timedelta(3) #create a cutoff for 3 days ago 
            if date_d < three_days_back: #check to see if the url date is within the 3 day cutoff
                return HttpResponseRedirect(reverse('user_homepage')) #send user back home if its not

        #main code body below
        school = School.objects.get(pk=school_id)
        #dateobj = date
        ## classes_list = Class.objects.filter(teacher=request.user.teacher, school__id=school.pk) 
        #this part below is to ensure that teachers and pricipals can only enter attendance for their schools (not others)
        if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'coordinator':
            classes_list = Class.objects.filter(school__id=school.pk).filter(shift = shift) #JQ: added
        else:
            s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added
            classes_list = Class.objects.filter(school__id=school.pk).filter(school_id__in = s).filter(shift = shift) #JQ: added

        date = datetime.datetime.strptime(date, "%Y-%m-%d").date()
        student_classes_attendance= dict()
        for cl in classes_list:
            students = Student.objects.filter(pkss_school__id=school.pk, pkss_class=cl, currently_enrolled=True)
            students_list = list(students.values())
            attended_students = list(Attendance.objects.filter(attendance_date=date, student__in=students).values())

            attended_students_dict = dict()
            for item in attended_students:
                 attended_students_dict[item["student_id"]] = {"attendance_date": item["attendance_date"],
                                                               "notes": item["notes"],
                                                               "attendance_id": item["id"],
                                                               "status": item["status"]
                                                               }
            for student in students_list:
                if student["id"] in attended_students_dict:
                    student["attendance_date"] = attended_students_dict[student["id"]]["attendance_date"]
                    student["notes"] = attended_students_dict[student["id"]]["notes"]
                    student["attendance_id"] = attended_students_dict[student["id"]]["attendance_id"]
                    student["status"] = attended_students_dict[student["id"]]["status"]

            student_classes_attendance[cl] = students_list

        if request.method == 'POST':
            #s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added
            #classes_list = Class.objects.filter(school__id=school.pk).filter(school_id__in = s).filter(shift = shift) #JQ: added
            if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager':
                classes_list = Class.objects.filter(school__id=school.pk).filter(shift = shift) #JQ: added
            else:
                s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added
                classes_list = Class.objects.filter(school__id=school.pk).filter(school_id__in = s).filter(shift = shift) #JQ: added
            msg = 'Attendance submitted successfully for %s on %s for %s classes.' % (school.school_name, date.strftime("%b %d, %Y"), shift)
            messages.success(request, msg)
            return redirect(reverse('attendance_dates', kwargs={'school_id': school.pk, 'shift': shift}))
        context = {
                   'date': date,
                   'school': school,
                   'school_id': school_id,
                   'shift': shift,
                   'student_classes_attendance': student_classes_attendance
                   }
        return render(request, 'group_attendance.html', context)


@login_required
def ajax_save_student_attendance(request):
    response_data = dict()

    if request.POST:
        data = request.POST
        user = request.user
        school_id = data.get("school_id")
        shift = data.get("shift")
        attendance_date = datetime.datetime.strptime(data.get("attendance_date"), "%b. %d, %Y")
        attendance_students_data = data.getlist(u"attendance_students_data")
        if attendance_students_data:
            attendance_students_data = ast.literal_eval(attendance_students_data[0])

            #re-use of the code from formset view to define access level
            if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager':
                classes_list = Class.objects.filter(school__id=school_id).filter(shift = shift) #JQ: added
            else:
                s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added
                classes_list = Class.objects.filter(school__id=school_id).filter(school_id__in = s).filter(shift = shift) #JQ: added
            available_classes_ids=[item.id for item in classes_list]

            new_attendances_list = list()
            for attendance_info in attendance_students_data:
                if attendance_info["class_id"] in available_classes_ids:
                    # print attendance_info
                    status = attendance_info[u"status"]
                    notes = attendance_info[u"notes"]
                    student_id = attendance_info[u"student_id"]
                    if attendance_info[u"attendance_id"]:
                        attendance = Attendance.objects.get(id=attendance_info[u"attendance_id"])
                        attendance.status = status
                        attendance.notes = notes
                        attendance.att_taker = user
                        attendance.save(force_update=True)
                    else:
                        attendance = Attendance(status=status, notes=notes,
                                                               attendance_date=attendance_date,
                                                               student_id=student_id,
                                                               att_taker=user
                                                )
                        new_attendances_list.append(attendance)
            Attendance.objects.bulk_create(new_attendances_list)

    return JsonResponse(response_data)


@login_required
def attendance_report(request):
    return render(request, 'attendance_report.html', {})


def get_attendance_months():
    truncate_month = connection.ops.date_trunc_sql('month', 'attendance_date')

    attendance = Attendance.objects.extra({'month': truncate_month}).values('month') \
        .annotate(
        attendace_days=Count('student')
    ).order_by('-attendance_date')

    # get months from attendance records

    # sqlite database backend
    # attendance_months = [datetime.datetime.strptime(dt['month'], "%Y-%m-%d").date() for dt in attendance]

    # postgres database backend
    attendance_months = [dt['month'].date() for dt in attendance]
    return attendance_months

@login_required
def attendance_summary(request):
    """
    Get last 12 months attendance records
    Group attendance by Month
    Calculate %ages for each School in each of the 12 months
    """
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator' or request.user.useraccess.access_level == 'accountant':
        attendance_months = get_attendance_months()

        if request.GET.get('date'):
            attendance_months = [datetime.datetime.strptime(request.GET.get('date'), "%Y-%m-%d").date()]
        else:
            # attendance last 12 months

            attendance_months = set(attendance_months)

            # convert back to list for sorting
            attendance_months = list(attendance_months)
            attendance_months.sort(reverse=True)

            # limit to last 12 months
            attendance_months = attendance_months[:12]

        last_12_months_attendance = {}


        # iterate over each month
        # filter schools who has attendance in each iterated month
        # get students attendance from each school
        for date in attendance_months:

            schools_in_month = School.objects \
                .filter(
                    student__attendance__attendance_date__year=date.year,
                    student__attendance__attendance_date__month=date.month
                )\
                .annotate(
                    days_attendance_entered=Count('student__attendance__attendance_date', distinct=True),
                    overall_present=Count(Case(When(student__attendance__status='present', then=1))),
                    overall_absent=Count(Case(When(student__attendance__status='absent', then=1))),
                    boys_present=Count(Case(When(student__attendance__status='present', student__gender='male', then=1))),
                    boys_absent=Count(Case(When(student__attendance__status='absent', student__gender='male', then=1))),
                    girls_present=Count(Case(When(student__attendance__status='present', student__gender='female', then=1))),
                    girls_absent=Count(Case(When(student__attendance__status='absent', student__gender='female', then=1))),
                    end_of_month=Max(Case(When(
                        student__attendance__student__pkss_school__id=F('id'), then=F('student__attendance__attendance_date')
                    ))),
                ).prefetch_related('attendancecalendar_set')

            for school in schools_in_month:
                try:
                    school_calendar = school.attendancecalendar_set.get(school=school, first_day_of_month__month=date.month, first_day_of_month__year=date.year)
                    school.working_days = school_calendar.workdays_in_month - (school_calendar.non_weekend_workdays_off if school_calendar.non_weekend_workdays_off else 0)
                except AttendanceCalendar.DoesNotExist:
                    school.working_days = 'N/A'

                school.boys_attendance = round(school.boys_present / (school.boys_present + school.boys_absent), 2) * 100 if (school.boys_present + school.boys_absent) != 0 else 0
                #school.girls_attendance = round(school.girls_present / (school.girls_present + school.girls_absent), 2) * 100
                school.girls_attendance = round(school.girls_present / (school.girls_present + school.girls_absent), 2) * 100 if (school.girls_present + school.girls_absent) != 0 else 0
                school.overall_attendance = round(school.overall_present / (school.overall_present + school.overall_absent), 2) * 100 if (school.overall_present + school.overall_absent) != 0 else 0

                school_end_of_month_enrollment = Attendance.objects.filter(attendance_date=school.end_of_month, student__pkss_school=school)
                school.end_of_month_enrollment = school_end_of_month_enrollment.count()
                school.end_of_month_enrollment_boys = school_end_of_month_enrollment.filter(student__gender='male').count()
                school.end_of_month_enrollment_girls = school_end_of_month_enrollment.filter(student__gender='female').count()

            # append schools monthly attendance to dict
            last_12_months_attendance.update({date: schools_in_month})

        # sort attendance by month desc
        last_12_months_attendance = OrderedDict(sorted(last_12_months_attendance.items(), key=lambda t: t[0], reverse=True))

        return render(request, 'attendance_summary.html', {'last_12_months_attendance': last_12_months_attendance})

@login_required
def school_attendance_details(request, school_id, date):
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'coordinator' or request.user.useraccess.access_level == 'accountant':
        date = datetime.datetime.strptime(date, "%Y-%m-%d").date()
        previous_month = date - relativedelta(months=1)

        school = School.objects.get(pk=school_id)

        school_attendance = Attendance.objects\
            .filter(
                attendance_date__year=date.year,
                attendance_date__month=date.month,
                student__pkss_school=school
            )

        try:
            monthly_attendance = school_attendance.values('student__pkss_school')\
                .annotate(
                    days_attendance_entered=Count('attendance_date', distinct=True),
                    overall_present=Count(Case(When(status='present', then=1))),
                    overall_absent=Count(Case(When(status='absent', then=1))),
                    boys_present=Count(Case(When(status='present', student__gender='male', then=1))),
                    boys_absent=Count(Case(When(status='absent', student__gender='male', then=1))),
                    girls_present=Count(Case(When(status='present', student__gender='female', then=1))),
                    girls_absent=Count(Case(When(status='absent', student__gender='female', then=1))),  
                )[0]

        # if 0 attendance for this school, return empty attendance list
        except IndexError:
            return render(request, 'school_attendance_details.html', {'attendance': []})

        monthly_attendance['avg_overall_present'] = monthly_attendance.get('overall_present') / monthly_attendance.get('days_attendance_entered')
        monthly_attendance['avg_boys_present'] = monthly_attendance.get('boys_present') / monthly_attendance.get('days_attendance_entered')
        monthly_attendance['avg_girls_present'] = monthly_attendance.get('girls_present') / monthly_attendance.get('days_attendance_entered')

        monthly_attendance['overall_attendance'] = round(monthly_attendance.get('overall_present') / (monthly_attendance.get('overall_present') + monthly_attendance.get('overall_absent')), 2) * 100
        monthly_attendance['boys_attendance'] = round(monthly_attendance.get('boys_present') / (monthly_attendance.get('boys_present') + monthly_attendance.get('boys_absent')), 2) * 100
        monthly_attendance['girls_attendance'] = round(monthly_attendance.get('girls_present') / (monthly_attendance.get('girls_present') + monthly_attendance.get('girls_absent')), 2) * 100

        # get previous month attendance
        previous_month_attendance = Attendance.objects\
            .filter(
                attendance_date__year=previous_month.year,
                attendance_date__month=previous_month.month,
                student__pkss_school=school
            )

        try:
            previous_attendance = previous_month_attendance.values('student__pkss_school') \
                .annotate(
                    overall_present=Count(Case(When(status='present', then=1))),
                    overall_absent=Count(Case(When(status='absent', then=1))),
                    boys_present=Count(Case(When(status='present', student__gender='male', then=1))),
                    boys_absent=Count(Case(When(status='absent', student__gender='male', then=1))),
                    girls_present=Count(Case(When(status='present', student__gender='female', then=1))),
                    girls_absent=Count(Case(When(status='absent', student__gender='female', then=1))),
                )[0]

            monthly_attendance['previous_overall_attendance'] = round(previous_attendance.get('overall_present') / (previous_attendance.get('overall_present') + previous_attendance.get('overall_absent')), 2) * 100
            monthly_attendance['previous_boys_attendance'] = round(previous_attendance.get('boys_present') / (previous_attendance.get('boys_present') + previous_attendance.get('boys_absent')), 2) * 100
            monthly_attendance['previous_girls_attendance'] = round(previous_attendance.get('girls_present') / (previous_attendance.get('girls_present') + previous_attendance.get('girls_absent')), 2) * 100

        # if 0 attendance for this school in prev month, return N/A
        except IndexError:
            monthly_attendance['previous_overall_attendance'] = 'N/A'
            monthly_attendance['previous_boys_attendance'] = 'N/A'
            monthly_attendance['previous_girls_attendance'] = 'N/A'

        try:
            current_month_working_days = AttendanceCalendar.objects\
                .get(
                    school=school,
                    first_day_of_month__year=date.year,
                    first_day_of_month__month=date.month
                    )\
                .workdays_in_month
            monthly_attendance['days_attendance_missing'] = current_month_working_days - monthly_attendance.get('days_attendance_entered')
            monthly_attendance['working_days'] = current_month_working_days

        except AttendanceCalendar.DoesNotExist:
            monthly_attendance['working_days'] = 'N/A'

        monthly_attendance['school'] = school

        # calculate attendance percentage group by class for school
        attendance_by_class = school_attendance\
            .values('student__pkss_class__class_name')\
            .annotate(
                present=Count(Case(When(status='present', then=1))),
                absent=Count(Case(When(status='absent', then=1)))
            )

        for clas in attendance_by_class:
            clas['attendance'] = round(clas['present'] / (clas['present'] + clas['absent']), 2) * 100

        # calculate attendance percentage group by class for school in previous month
        attendance_by_class_previous = previous_month_attendance\
            .values('student__pkss_class__class_name')\
            .annotate(
                present=Count(Case(When(status='present', then=1))),
                absent=Count(Case(When(status='absent', then=1)))
            )

        for clas in attendance_by_class_previous:
            clas['attendance'] = round(clas['present'] / (clas['present'] + clas['absent']), 2) * 100

        monthly_attendance['class_attendance'] = attendance_by_class
        monthly_attendance['class_attendance_previous'] = attendance_by_class_previous
        monthly_attendance['date'] = date

        # calculate attendance, absent, present for each date in current school
        by_date_attendance = school_attendance\
            .values('attendance_date')\
            .annotate(
                present=Count(Case(When(status='present', then=1))),
                absent=Count(Case(When(status='absent', then=1)))
        )

        by_date_attendance = {
                                att['attendance_date']: {
                                    'present': att['present'],
                                    'absent': att['absent'],
                                    'overall_attendance': round(att['present'] / (att['present'] + att['absent']), 2) * 100
                                }
                                for att in by_date_attendance}

        # calculate by date attendance for each class in current school in current month's each date
        by_date_classes = dict()
        for dt in by_date_attendance.keys():
            class_attendance = school_attendance\
                .filter(attendance_date=dt)\
                .values('student__pkss_class__class_name')\
                .annotate(
                    present=Count(Case(When(status='present', then=1))),
                    absent=Count(Case(When(status='absent', then=1)))
                )
            by_date_class_attendance = {}
            for clas in class_attendance:
                by_date_class_attendance[clas['student__pkss_class__class_name']] = round(clas['present'] / (clas['present'] + clas['absent']), 2) * 100

            by_date_attendance[dt]['class_attendance'] = by_date_class_attendance

            # we are getting classes for date on which there is maximum attendance to get all classes names
            if len(by_date_classes) < len(by_date_class_attendance):
                by_date_classes = by_date_class_attendance

        # append by_date_attendance to monthly attendance
        by_date_attendance = OrderedDict(sorted(by_date_attendance.items(), key=lambda t: t[0], reverse=True))

        monthly_attendance['by_date_classes'] = by_date_classes  # by_date_attendance[dt]['class_attendance'].keys()

        monthly_attendance['by_date_attendance'] = by_date_attendance

        return render(request, 'school_attendance_details.html', {'attendance': monthly_attendance})


def attendance_by_month(request):
    """
    Get all months in which attendance has been entered
    """
    return render(request, 'attendance_by_month.html', {'attendance_months': set(get_attendance_months())})

@login_required
def attendance_by_school_month(request):
    if request.user.useraccess.access_level == 'super' or request.user.useraccess.access_level == 'manager' or request.user.useraccess.access_level == 'principal' or request.user.useraccess.access_level == 'teacher' or request.user.useraccess.access_level == 'coordinator' or request.user.useraccess.access_level == 'accountant':
        attendance_months = get_attendance_months()

        attendance = dict()

        # attendance last 12 months

        attendance['months'] = set(attendance_months)

        # convert back to list for sorting
        attendance['months'] = list(attendance['months'])
        attendance['months'].sort(reverse=True)

        # limit to last 12 months
        attendance['months'] = attendance['months'][:12]
        attendance['schools'] = dict()

        # required dict format in template
        """
        {
             months: [jan, feb, march]
             schools: {
                         pk1: {jan: 23, feb: N/A, march:33},
                         pk2: {jan: N/A, feb: 99, march: 33},
                         pk3: {jan: 23, feb: 88, march: 33}
                       }
         }
        """

        # iterate over each month
        # filter schools who has attendance in each iterated month
        # get students attendance from each school
        for date in attendance['months']: 

            schools_in_month = School.objects \
                .filter(
                    student__attendance__attendance_date__year=date.year,
                    student__attendance__attendance_date__month=date.month
                )\
                .annotate(
                    present=Count(Case(When(student__attendance__status='present', then=1))),
                    absent=Count(Case(When(student__attendance__status='absent', then=1))),
                )

            for school in schools_in_month:
                school.attendance = round(school.present / (school.present + school.absent), 2) * 100
                if school.school_name in attendance['schools'].keys():
                    attendance['schools'][school.school_name].update({date: school.attendance})
                else:
                    attendance['schools'][school.school_name] = {date: school.attendance}

        cursor = connection.cursor()

        cursor.execute(
        '''SELECT 
        Extract(year from q1.attendance_date) AS year,
        Extract(month from q1.attendance_date) AS mth,
        COUNT(DISTINCT (q1.attendance_date)) AS days_att_entered,
        SUM( CASE WHEN  status = 'present' THEN 1 ELSE 0 END) AS present,
        count(*) AS count,
        SUM(CASE WHEN  status = 'present' THEN 1 ELSE 0 END)/ CAST(count(*) AS FLOAT) * 100 AS att_perc
        FROM
        (SELECT A.*, B.pkss_school_id
        FROM attendance_attendance AS A
        INNER JOIN students_student AS B ON A.student_id = B.id
        WHERE attendance_date > Date(Now() -  Interval '12 month') ) as q1
        GROUP BY year, mth
        ORDER BY year DESC, mth DESC;''', [])
        overall = dictfetchall(cursor) #raw sql query to get attendance for all schools

        return render(request, 'attendance_by_school_month.html', {'attendance': attendance, 'overall': overall})
         


#SECOND VERSION OF ATTENDANCE - JUST FOR report viewing
@login_required 
def view_attendance_deets(request, school_id, date, readonly=False):
    ## classes_list = Class.objects.filter(teacher=request.user.teacher, school__id=school.pk)
    #s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added 
    school = School.objects.get(pk=school_id)
    classes_list = Class.objects.filter(school__id=school.pk) #JQ: added
    formsets = {}

    for clas in classes_list:
        students_list = Student.objects.filter(pkss_school__id=school.pk, pkss_class=clas).filter(currently_enrolled=True)
        students_list_initial = [{
                             'student': student,
                             'attendance_date': date,
                         }
                         for student in students_list
                         ]

        attendance_formset = modelformset_factory(Attendance, form=AttendanceForm,
                                                  extra=len(students_list),
                                                  max_num=len(students_list)
                                                  )

        formsets[clas] = attendance_formset(initial=students_list_initial,
                                            queryset=Attendance.objects.filter(attendance_date=date, student__in=students_list),
                                            prefix=clas)

    date = datetime.datetime.strptime(date, "%Y-%m-%d").date()

    if request.method == 'POST':
        #classes_list = Class.objects.filter(teacher=request.user.teacher, school__id=school.pk)
        school = School.objects.get(pk=school_id)
        classes_list = Class.objects.filter(school__id=school.pk) #JQ: added
        
        formsets = {}
        formsets_valid = True
        for clas in classes_list:
            students_list = Student.objects.filter(pkss_school__id=school.pk, pkss_class=clas).filter(currently_enrolled=True)
            attendance_formset = modelformset_factory(Attendance, form=AttendanceForm,
                                                      extra=len(students_list),
                                                      max_num=len(students_list)
                                                      )

            formsets[clas] = attendance_formset(request.POST, prefix=clas)
            if formsets[clas].is_valid():
                formsets[clas].save()
            else:
                formsets_valid = False

        if formsets_valid:
            msg = 'Attendance submitted successfully for %s on %s.' % (school.school_name, date.strftime("%b %d, %Y"))
            messages.success(request, msg)
            return redirect(reverse('attendance_dates', kwargs={'school_id': school.pk}))
    

#Attendance viewing last attempt 8-7-17
@login_required 
def view_daily_attendance_deets(request, school_id, date):
    #school = School.objects.get(pk=school_id)
    #class, student, status, date, datestamp, att taker - filter school and date
    #att_list = Attendance.objects.filter(student.school.id = school_id )
    date_d = datetime.datetime.strptime(date, "%Y-%m-%d").date() #convert date string to date object
    att_list = Attendance.objects.filter(student__pkss_school_id = school_id).filter(attendance_date = date_d)
    school = School.objects.get(id=school_id) 
    context = {
            'att_list': att_list, 
            'date_d': date_d,
            'school': school,  
            } 
    return render(request, 'attendace_details_date.html', context)

