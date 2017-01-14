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
from django.db import connection
from django.db.models import *
import datetime
from collections import OrderedDict
from django.utils import timezone
from dateutil.relativedelta import relativedelta


def go_home(request):	
	return render(request, "home.html", {})


# def add_attendance(request):
# 	form = AttendanceForm(request.POST or None, request.FILES or None)
# 	if form.is_valid():
# 		try:
# 			instance = form.save(commit=False)
# 			#instance.master = Master.objects.get(pk=pk)
# 			instance.save()
# 			#return HttpResponseRedirect( instance.get_absolute_url() )
# 			return HttpResponseRedirect('/')
# 		except:
# 			return HttpResponseRedirect('/')
# 	context = {
# 		"form": form,
# 	}
# 	return render(request, "add_attendance.html", context)


def go_home(request):
    return render(request, "home.html", {})


def get_dates_range(start, end, delta):
    curr = start
    while curr < end:
        yield curr
        curr += delta


@login_required()
def affiliated_schools(request):
    schools = School.objects.filter(teacher=request.user.teacher)
    return render(request, 'affiliated_schools.html', {'affiliated_schools': schools})


@login_required()
def attendance_dates(request, school_id):
    five_days_back = date.today() - timedelta(5)
    next_day = date.today() + timedelta(1)
    dates_range = list(get_dates_range(five_days_back, next_day, timedelta(days=1)))
    return render(request, 'attendance_dates.html', {'dates_range': dates_range, 'school_id': school_id})


@login_required()
def add_attendance2(request, school_id, date, readonly=False):
    school = School.objects.get(pk=school_id)
    ## classes_list = Class.objects.filter(teacher=request.user.teacher, school__id=school.pk)
    s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added
    classes_list = Class.objects.filter(school__id=school.pk).filter(school_id__in = s) #JQ: added

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

    if request.method == 'POST':
        #classes_list = Class.objects.filter(teacher=request.user.teacher, school__id=school.pk)
        s = School.objects.filter(teacher__id = request.user.teacher.id) #JQ: added
        classes_list = Class.objects.filter(school__id=school.pk).filter(school_id__in = s) #JQ: added
        
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
            messages.success(request, 'Attendance submitted successfully.')
            return redirect(reverse('attendance_dates', kwargs={'school_id': school.pk}))

    return render(request, 'group_attendance.html', {'formsets': formsets, 'date': date, 'school': school})


def go_home(request):
    return render(request, "home.html", {})


def attendance_report(request):
    return render(request, 'attendance_report.html', {})


def get_attendance_months():
    truncate_month = connection.ops.date_trunc_sql('month', 'attendance_date')

    attendance = Attendance.objects.extra({'month': truncate_month}).values('month') \
        .annotate(
        attendace_days=Count('student')
    ).order_by('-attendance_date')

    # get months from attendance records
    attendance_months = [datetime.datetime.strptime(dt['month'], "%Y-%m-%d").date() for dt in attendance]
    return attendance_months


def attendance_summary(request):
    """
    Get last 12 months attendance records
    Group attendance by Month
    Calculate %ages for each School in each of the 12 months
    """

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
            working_days=F('attendancecalendar__workdays_in_month'),
            overall_present=Count(Case(When(student__attendance__status='present', then=1))),
            overall_absent=Count(Case(When(student__attendance__status='absent', then=1))),
            boys_present=Count(Case(When(student__attendance__status='present', student__gender='male', then=1))),
            boys_absent=Count(Case(When(student__attendance__status='absent', student__gender='male', then=1))),
            girls_present=Count(Case(When(student__attendance__status='present', student__gender='female', then=1))),
            girls_absent=Count(Case(When(student__attendance__status='absent', student__gender='female', then=1))),
            end_of_month=Max(Case(When(
                student__attendance__student__pkss_school__id=F('id'), then=F('student__attendance__attendance_date')
            ))),

            )

        for school in schools_in_month:
            school.boys_attendance = round(school.boys_present / (school.boys_present + school.boys_absent), 2) * 100
            school.girls_attendance = round(school.girls_present / (school.girls_present + school.girls_absent), 2) * 100
            school.overall_attendance = round(school.overall_present / (school.overall_present + school.overall_absent), 2) * 100
            school_end_of_month_enrollment = Attendance.objects.filter(attendance_date=school.end_of_month)
            school.end_of_month_enrollment = school_end_of_month_enrollment.count()
            school.end_of_month_enrollment_boys = school_end_of_month_enrollment.filter(student__gender='male').count()
            school.end_of_month_enrollment_girls = school_end_of_month_enrollment.filter(student__gender='female').count()

        # append schools monthly attendance to dict
        last_12_months_attendance.update({date: schools_in_month})

    # sort attendance by month desc
    last_12_months_attendance = OrderedDict(sorted(last_12_months_attendance.items(), key=lambda t: t[0], reverse=True))

    return render(request, 'attendance_summary.html', {'last_12_months_attendance': last_12_months_attendance})


def school_attendance_details(request, school_id, date):
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

    # if 0 attendance for this school, return empty attendance list
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
        .values('student__pkss_school__class__class_name')\
        .annotate(
            present=Count(Case(When(status='present', then=1))),
            absent=Count(Case(When(status='absent', then=1)))
        )

    for clas in attendance_by_class:
        clas['attendance'] = round(clas['present'] / (clas['present'] + clas['absent']), 2) * 100

    # calculate attendance percentage group by class for school in previous month
    attendance_by_class_previous = previous_month_attendance\
        .values('student__pkss_school__class__class_name')\
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
    school_classes = Class.objects.filter(school=school)
    for dt in by_date_attendance.keys():
        class_attendance = school_classes.filter(school__student__attendance__attendance_date=dt)\
            .values('class_name')\
            .annotate(
                present=Count(Case(When(school__student__attendance__status='present', then=1))),
                absent=Count(Case(When(school__student__attendance__status='absent', then=1)))
            )

        by_date_class_attendance = {}
        for clas in class_attendance:
            by_date_class_attendance[clas['class_name']] = round(clas['present'] / (clas['present'] + clas['absent']), 2) * 100

        by_date_attendance[dt]['class_attendance'] = by_date_class_attendance.values()

    # append by_date_attendance to monthly attendance
    by_date_attendance = OrderedDict(sorted(by_date_attendance.items(), key=lambda t: t[0], reverse=True))

    monthly_attendance['by_date_attendance'] = by_date_attendance

    return render(request, 'school_attendance_details.html', {'attendance': monthly_attendance})


def attendance_by_month(request):
    """
    Get all months in which attendance has been entered
    """
    return render(request, 'attendance_by_month.html', {'attendance_months': set(get_attendance_months())})


def attendance_by_school_month(request):

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

    return render(request, 'attendance_by_school_month.html', {'attendance': attendance})
