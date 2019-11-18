SET ANSI_WARNINGS OFF
select cast(D.MonthYearDesc as varchar(6)) as Year_Month ,sum([mesure_IndexAdmissionInd]) as mesure_IndexAdmissionInd ,
case when  sum([measure_ReadmissionInd]) is null then 0 else
sum([measure_ReadmissionInd]) end as measure_ReadmissionInd,
case when sum([measure_ReadmissionInd]) is null or sum([mesure_IndexAdmissionInd]) is null then left(cast(cast(0 as money)as varchar),4) else
cast(convert(decimal(16,2),cast(sum([measure_ReadmissionInd]) as decimal)/cast(sum([mesure_IndexAdmissionInd]) as decimal)) as varchar (4)) end as mesure_ReadmissionRate
from [dbmSemanticAnalytics].Fact.Readmissions Re
left join [dbmSemanticAnalytics].dim.[Dates] D on
Re.date_DischargeIndexAdmission = D.DateKey
where cast(D.MonthYearDesc as varchar(6)) is not null
group by D.MonthYearDesc
order by max(date_DischargeIndexAdmission)