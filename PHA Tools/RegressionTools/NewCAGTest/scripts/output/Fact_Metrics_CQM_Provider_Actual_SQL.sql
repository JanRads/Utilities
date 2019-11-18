 select left(datekey,6)date_YearMonth,provider, count(distinct [Patient Key]) SumOfPatients
from Fact.Metrics_CQM
group by datekey,provider
order by 1,2