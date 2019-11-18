SET ANSI_WARNINGS OFF


/*******************  IN  ******************************/
--# of Admissions
declare @Date as varchar(8) ='2013%'
SELECT [Desc], [Prev Score] FROM(
select [Desc], round([Prev Score],3) as  [Prev Score]  from (
select 'Same RR' as [Desc], cast(sum(case when [attrib_SameDischargeFacilityInd] = 1 then 1 else 0 end)*1.0/sum([mesure_IndexAdmissionInd])  as nvarchar(100)) as   [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
--and measure_ReadmissionInd = 1 
) a 




union

 select [Desc],  round([Prev Score],3) as [Prev Score]  from (
select 'AVG DTR' as [Desc], sum([measure_TimeBetweenAdmissions])*1.0/sum([measure_ReadmissionInd])/24.00 as [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like '%2013%' --@Date
and measure_ReadmissionInd = 1 )a

union 
select '# Patients' as [Desc], cast(count(distinct id_Patient) as nvarchar(100)) as [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions 
where date_DischargeIndexAdmission like @Date
AND attrib_SameDischargeFacilityInd <> -1

union
select [Desc], round([Prev Score],3) as [Prev Score]   from (
select 'ReAdm Rate' as [Desc], sum(measure_ReadmissionInd)*1.0/sum([mesure_IndexAdmissionInd])  as   [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like @Date ) a

union

--Avg LOS
select [Desc], round([Prev Score],3) as [Prev Score]   from (
select 'AVG LOS' as [Desc], sum([measure_LengthOfStay_IndexAdm])*1.0/sum([mesure_IndexAdmissionInd])/24.0  as   [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like '2013%' ) a


union

select [Desc], round([Prev Score],3) as [Prev Score]   from (
select 'FUV 7' as [Desc], sum([measure_FUV_7Day_Ind])*1.0/sum([mesure_IndexAdmissionInd]) as  [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like @Date )a

union


select '# ReAdm' as [Desc],  cast(sum(measure_ReadmissionInd) as nvarchar(100)) as   [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like @Date and measure_ReadmissionInd = 1
union
select 'Admissions' as [Desc], cast(sum([mesure_IndexAdmissionInd]) as nvarchar(100))  as [Prev Score]
from [dbmSemanticAnalytics].fact.Readmissions
where date_DischargeIndexAdmission like @Date
) A ORDER BY [DESC]