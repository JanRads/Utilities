--use [dbmsemanticanalytics].

select id_patient,IndicatorId,FromDate,To_Date
from [dbmSemanticAnalytics].fact.ActiveIndicator
where [IndicatorId] in(63,60,64)