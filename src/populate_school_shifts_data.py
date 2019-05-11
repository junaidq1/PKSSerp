import os
import sys
os.environ['DJANGO_SETTINGS_MODULE'] = 'PKSSerp.settings'
sys.path.append(os.path.join(os.path.dirname(__file__),".."))
import django
django.setup()
from schools.models import School, SchoolShift, SHIFT_CHOICES
from teachers.models import Teacher
from tattendance.models import TeacherAttendance
import time


schools = School.objects.all()
for school in schools.iterator():
    shifts = SHIFT_CHOICES
    for shift in shifts:
        SchoolShift.objects.get_or_create(school=school, shift=shift[0])


teachers = Teacher.objects.all()
for teacher in teachers.iterator():
    teacher_schools = teacher.pkss_school.all()
    for teacher_school in teacher_schools.iterator():
        school_shift = SchoolShift.objects.get(school=teacher_school, shift="morning")
        teacher.pkss_school_shift.add(school_shift)


teacher_attendances = TeacherAttendance.objects.all()
for teacher_attendance in teacher_attendances.iterator():
    school = teacher_attendance.school
    if school:
        school_shift = SchoolShift.objects.get(school=school, shift="morning")
        teacher_attendance.school_shift = school_shift
        teacher_attendance.save(force_update=True)


