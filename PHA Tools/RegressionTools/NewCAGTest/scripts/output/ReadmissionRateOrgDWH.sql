SET ANSI_WARNINGS OFF
select cast(O.level3 as varchar(15)) as OrgLevel3 ,sum([mesure_IndexAdmissionInd]) as mesure_IndexAdmissionInd ,
case when  sum([measure_ReadmissionInd]) is null then 0 else
sum([measure_ReadmissionInd]) end as measure_ReadmissionInd,
case when sum([measure_ReadmissionInd]) is null or sum([mesure_IndexAdmissionInd]) is null then left(cast(cast(0 as money)as varchar),4) else
cast(convert(decimal(16,2),cast(sum([measure_ReadmissionInd]) as decimal)/cast(sum([mesure_IndexAdmissionInd]) as decimal)) as varchar (4))  end as mesure_ReadmissionRate
from [dbmSemanticAnalytics].Fact.Readmissions Re
left join [dbmSemanticAnalytics].dim.Organizations O on
Re.org_Assigned_IndexAdm = O.OrganizationKey
where Re.sys_PartitionDate is not null
group by cast(O.level3 as varchar(15))
order by cast(O.level3 as varchar(15))