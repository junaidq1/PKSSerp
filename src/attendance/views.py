from attendance.forms import AttendanceForm
from django.shortcuts import render, redirect, reverse
from django.contrib.auth.decorators import login_required
from students.models import Student
from schools.models import School
from datetime import date, timedelta
from django.forms import modelformset_factory
from attendance.models import Attendance
from classes.models import Class
from django.contrib import messages


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
def add_attendance2(request, school_id, date):
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

