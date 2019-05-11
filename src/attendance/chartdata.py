from datetime import datetime, timedelta
from .models import Attendance
from django_pandas.io import read_frame
import numpy as np
import pandas as pd 

# import core 
 
class ChartData(object):

	@classmethod
	def get_monthly_school_att(cls):
		qs = Attendance.objects.all()

		df = read_frame(qs, fieldnames=['attendance_date', 'status', 'student__pkss_school'])
		df['attendance_date'] =  pd.to_datetime(df['attendance_date'])
		df = df.rename(columns = {'student__pkss_school':'school_name'})

		df['attendance_year'] = df['attendance_date'].dt.year
		df['attendance_month'] = df['attendance_date'].dt.month
		df['attendance_day'] = df['attendance_date'].dt.day
		df['year_month'] = df['attendance_year'].astype(str) + '_' + df['attendance_month'].astype(str)

		df2 = df.groupby(['school_name', 'year_month', 'attendance_year', 'attendance_month']) #added pk just to test, remove later
		df2 = df2.apply(lambda x: pd.Series(dict(
			present=(x['status'] == 'present').sum(),
			total= len(x['status']))))
		df2 = df2.reset_index()
		df2['percent'] = df2['present'] / df2['total'] *100
		df2 = df2.round({'percent': 1})
		piv = df2.pivot_table(index=['year_month', 'attendance_year', 'attendance_month'], columns=['school_name'], values='percent').reset_index()
		piv.fillna(value=0, inplace=True) #fills NAs with 0's
		piv.sort_values(by=['attendance_year', 'attendance_month'], ascending=[True, True], inplace=True)
		data = piv[['year_month', 'PK1','PK2','PK3','PK4','PK5','PK6','PK7','PK8']] 

		data = data.to_dict(orient='list') 
		#data = data.to_dict(orient='records') #supposedly need this for tooltip, but cant work
		return data


