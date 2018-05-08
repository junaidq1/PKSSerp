from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from django.core.mail import send_mail
import datetime
from django.db import connection #for custom sql
from django.template.loader import render_to_string

# this helper function below is a custom func to convert the cursor object return to a dict
def dictfetchall(cursor):
	#Return all rows from a cursor as a dict
	columns = [col[0] for col in cursor.description]
	return [
		dict(zip(columns, row))
		for row in cursor.fetchall()
	]


# ###this works	
# class Command(BaseCommand):
# 	def handle(self, *args, **options):
# 		subject = 'test subj' 
# 		contact_message = 'this is a test message'
    
# 		from_email = settings.EMAIL_ADDR
# 		to_email = ['junaidq1@gmail.com', 'gtg592v@gmail.com'] 
# 		send_mail(subject, 
# 		contact_message, 
# 		from_email, 
# 		to_email, 
# 		#html_message=some_html_message,
# 		fail_silently=False)
# 		# return HttpResponseRedirect('/') 




#new thing - lets test this
class Command(BaseCommand):
	def handle(self, *args, **options):
		date_today = datetime.date.today()
		date_today_minus1 = date_today - datetime.timedelta(days= 1)
		date_today_minus2 = date_today - datetime.timedelta(days= 2)

		cursor = connection.cursor()
		cursor.execute(
		'''SELECT school_name, pkss_school_id, shift,
    	CASE WHEN q2.total_today >0 THEN q2.present_today / CAST(q2.total_today AS float) * 100 ELSE 0 END AS attendance_today,
    	CASE WHEN q2.total_minus1 >0 THEN q2.present_minus1 / CAST(q2.total_minus1 AS float) * 100 ELSE 0 END AS attendance_minus1,
    	CASE WHEN q2.total_minus2 >0 THEN q2.present_minus2 / CAST(q2.total_minus2 AS float) * 100 ELSE 0 END AS attendance_minus2
    	FROM (SELECT 
        q1.school_name, pkss_school_id, shift,
        --Extract(day from Now() -  Interval '1 day') AS today,
        SUM( CASE WHEN  status = 'present' AND (Extract(day from q1.attendance_date) = Extract(day from Now()) ) THEN 1 ELSE 0 END) AS present_today,
        SUM( CASE WHEN (Extract(day from q1.attendance_date) = Extract(day from Now()) ) THEN 1 ELSE 0 END)  AS total_today
        ,
        SUM( CASE WHEN  status = 'present' AND (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '1 day')) THEN 1 ELSE 0 END) AS present_minus1,
        SUM( CASE WHEN (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '1 day')) THEN 1 ELSE 0 END)  AS total_minus1
        ,
        SUM( CASE WHEN  status = 'present' AND (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '2 day')) THEN 1 ELSE 0 END) AS present_minus2,
        SUM( CASE WHEN (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '2 day')) THEN 1 ELSE 0 END)  AS total_minus2
        FROM
            (SELECT A.*, B.pkss_school_id, C.school_name, D.shift
            FROM attendance_attendance AS A
            INNER JOIN students_student AS B ON A.student_id = B.id
            INNER JOIN schools_school AS C on B.pkss_school_id = C.id
            INNER JOIN classes_class AS D on B.pkss_class_id = D.id
            WHERE attendance_date > Date(Now() -  Interval '5 day') ) as q1
    	GROUP BY school_name, pkss_school_id, shift
    	ORDER BY school_name, shift DESC) as q2;''',)

		att = dictfetchall(cursor) #raw sql query list of dates 

		cursor.execute(
		'''SELECT 
		q1.school_name, 
		q1.pkss_school_id, 
		SUM( CASE WHEN  status = 'present' AND (Extract(day from q1.attendance_date) = Extract(day from Now()) ) THEN 1 ELSE 0 END) AS present_today,
		SUM( CASE WHEN (Extract(day from q1.attendance_date) = Extract(day from Now()) ) THEN 1 ELSE 0 END)  AS total_today
		,
		SUM( CASE WHEN  status = 'present' AND (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '1 day')) THEN 1 ELSE 0 END) AS present_minus1,
		SUM( CASE WHEN (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '1 day')) THEN 1 ELSE 0 END)  AS total_minus1
		,
		SUM( CASE WHEN  status = 'present' AND (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '2 day')) THEN 1 ELSE 0 END) AS present_minus2,
		SUM( CASE WHEN (Extract(day from q1.attendance_date) = Extract(day from Now() -  Interval '2 day')) THEN 1 ELSE 0 END)  AS total_minus2
		FROM
			(SELECT A.*, C.id AS pkss_school_id, C.school_name
			FROM tattendance_teacherattendance AS A
			INNER JOIN schools_school AS C on A.school_id = C.id
			WHERE attendance_date > Date(Now() -  Interval '5 day') ) as q1
		GROUP BY school_name, q1.pkss_school_id
		ORDER BY school_name ;''',)

		teacher_att = dictfetchall(cursor) 

		template_html = 'attendance_report_email.html'
		subject = 'PKSS Daily Attendance Report | %s' %(date_today) 
		contact_message = ''
		html_content = render_to_string(template_html, {
		'att': att,
		'teacher_att': teacher_att,
		'date_today': date_today,
		'date_today_minus1': date_today_minus1,
		'date_today_minus2': date_today_minus2,
		})

		from_email = settings.EMAIL_ADDR
		to_email = ['sabiranq@gmail.com', 'farah.kashif@jaqtrust.org','ghazanfar.ali@jaqtrust.org', 
		'sadia.zahoor@jaqtrust.org', 'arsalan.hussain@jaqtrust.org','junaidq1@gmail.com']
		# to_email = ['junaidq1@gmail.com']
		send_mail(subject, 
				contact_message, 
				from_email, 
				to_email, 
				html_message=html_content,
				fail_silently=False)
		#return HttpResponseRedirect('/') 



