use [dbmSemanticAnalytics]

select 
	id_patient,
	min(date_yearmonth) fromdate,
	max(date_yearmonth) todate
from fact.mssp a
where msspkey = 12
group by id_patient
order by 1,2,3