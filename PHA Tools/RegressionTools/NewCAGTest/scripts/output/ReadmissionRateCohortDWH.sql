SET ANSI_WARNINGS OFF
select cast(C.CohortDesc as varchar(50)) as Cohort ,sum([mesure_IndexAdmissionInd]) as mesure_IndexAdmissionInd ,
case when  sum([measure_ReadmissionInd]) is null then 0 else
sum([measure_ReadmissionInd]) end as measure_ReadmissionInd,
case when sum([measure_ReadmissionInd]) is null or sum([mesure_IndexAdmissionInd]) is null then left(cast(cast(0 as money)as varchar),4) else
cast(convert(decimal(16,2),cast(sum([measure_ReadmissionInd]) as decimal)/cast(sum([mesure_IndexAdmissionInd]) as decimal)) as varchar (4))  end as mesure_ReadmissionRate
from [dbmSemanticAnalytics].Fact.Readmissions Re
left join [dbmSemanticAnalytics].dim.Cohorts C on
Re.attrib_Cohort = C.CohortKey
where Re.sys_PartitionDate is not null
group by cast(C.CohortDesc as varchar(50))
order by cast(C.CohortDesc as varchar(50))