from django.shortcuts import render
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db.models import Count, Sum, Avg, Max, Min,Q
from schools.models import School
from classes.models import Class 
# Create your views here.
from .models import Student
from .forms import StudentForm, StudentUnenrollForm
 
 
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