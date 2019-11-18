select left(datekey,6)date_YearMonth,Level2Desc,[Measure Key], count(distinct [Patient Key]) SumOfPatients
from Fact.Metrics_CQM CQM
join [dbmSemanticAnalyticsSTG].Config.MetricsDefinitions CMD on CMD.MetricKey = CQM.[Measure Key]
group by datekey, Level2Desc, [Measure Key]
order by 1,3

