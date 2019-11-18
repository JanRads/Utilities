use [dbmSemanticAnalytics]

select *
from fact.Metrics a
where a.MetricKey in (1,2,3,4)
order by 1,2,3