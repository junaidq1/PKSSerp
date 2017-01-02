from django.shortcuts import render

# Create your views here.
from attendance.models import Attendance

from attendance.forms import AttendanceForm
from django.db import connection  #for custom SQL
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.forms import formset_factory
from students.models import Student


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


def add_attendance2(request):
	
	s = Student.objects.all().values()
	#s = Student.objects.values('id')
	#s = [d['first_name'] for d in s]

	AttendanceFormSet = formset_factory(AttendanceForm, extra=0)
	formset = AttendanceFormSet(request.POST or None, initial=s)
	#form = AttendanceForm(request.POST or None, request.FILES or None)

	#some_formset = FormSet(initial=[{'id': 'x.id'} for x in some_objects])
	
	if formset.is_valid():
		try:
			instance = form.save(commit=False)
			#instance.master = Master.objects.get(pk=pk)
			instance.save()
			#return HttpResponseRedirect( instance.get_absolute_url() ) 
			return HttpResponseRedirect('/') 
		except:
			return HttpResponseRedirect('/')
	context = {
		"formset": formset,
	}
	return render(request, "group_attendance.html", context)


def go_home(request):	
	return render(request, "home.html", {})

