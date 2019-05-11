from django.core.management.base import BaseCommand, CommandError
import csv
from students.models import Student
from schools.models import School
from classes.models import Class
from donors.models import Donor, Donor_log
import datetime 


class Command(BaseCommand):

	def add_arguments(self, parser):
		parser.add_argument('csv_file', nargs='+', type=str)

	def handle(self, *args, **options):
		for csv_file in options['csv_file']:
			dataReader = csv.reader(open(csv_file), delimiter=',', quotechar='"')
			for row in dataReader:
				don = Donor_log()
				
				don_name = Donor.objects.get(reg=row[0])  #first get school name
				don.contact_name = don_name
				don.donation_date = datetime.datetime.strptime(row[1], '%m/%d/%Y').date()
				don.fiscal_year = row[2]
				don.currency = row[3]
				don.amount_local_currency = row[4]
				don.conversion_rate_if_not_PKR = row[5]
				don.amount_pkr = row[6]
				don.donation_notes = row[7]
				don.save()
				self.stdout.write(
					'Created donation {} {}'.format(don.contact_name, don.donation_date)
				)