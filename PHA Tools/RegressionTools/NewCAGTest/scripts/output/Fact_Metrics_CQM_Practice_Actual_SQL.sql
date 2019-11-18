select left(datekey,6)date_YearMonth, Practice, count(distinct [Patient Key]) SumOfPatients
from Fact.Metrics_CQM
group by datekey,Practice
order by 1,2
