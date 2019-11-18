use [dbmSemanticAnalytics]
--expected patients MSSP pnemovax fact-->> fact.activeInd
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

with ac as
(
	select * from [dbmSemanticAnalytics].dim.AdminCodes
)


,fact as

	(
		select id_Patient, 'ABM' fact, p.date_Visit d, p.attrib_EncounterType code
	from 	[dbmSemanticAnalytics].fact.AmbulatoryVisits p
	
	union

		select id_Patient, 'claim_GV', p.date_Claim, p.attrib_Claim
		from [dbmSemanticAnalytics].fact.Claims p
			inner join ac ac
			on p.attrib_Claim = ac.admincodekey

		where ac.Baseline_Code in ('99201','99202','99203','99204','99205','99212','99213','99214','99215','99341','99342','99343','99344','99345','99347','99348','99349','99350','99385','99386','99387','99395','99396','99397','G0438','G0439')
			and ac.Baseline_CodeSystemName in ('CPT-4','HCPCS')

union

			
		select id_Patient, 'Immunization_pn', p.date_Start, p.attrib_ImmunizationCode
		from [dbmSemanticAnalytics].[Fact].[Immunizations] p
			inner join ac ac
			on p.attrib_ImmunizationCode = ac.AdminCodeKey
		where ac.Baseline_Code in ('33') 
		and ac.Baseline_CodeSystemName = 'CVX'

		union

		select id_Patient, 'procedure_pn', p.date_Start, p.attrib_Procedure
		from [dbmSemanticAnalytics].fact.procedures p
			inner join ac ac
			on p.attrib_Procedure = ac.AdminCodeKey
		where ac.Baseline_Code in ('12866006','394678003','473165003','310578008') 
		and ac.Baseline_CodeSystemName = 'SNOMED-CT'

		union

		select id_Patient, 'condition_pn', p.date_ConditionStart, p.attrib_ConditionCode
		from [dbmSemanticAnalytics].fact.Conditions p
			inner join ac ac
			on p.attrib_ConditionCode = ac.AdminCodeKey
		where ac.Baseline_Code in ('12866006','394678003','473165003','310578008') 
		and ac.Baseline_CodeSystemName = 'SNOMED-CT'

		union

		select id_Patient, 'claim_pn', p.date_Claim, p.attrib_Claim
		from [dbmSemanticAnalytics].fact.Claims p
		inner join ac ac
		on p.attrib_Claim = ac.admincodekey
		where ac.Baseline_Code in ('90732_C4')
		and ac.Baseline_CodeSystemName = 'CPT-4'
	)

select F.id_Patient--, f.fact
	,f.code
	,MAX(f.d) maxdate
from fact f
	inner join dim.Patients p
	on f.id_Patient = p.PatientKey
	inner join fact.MSSP ms
	on f.id_Patient = ms.Id_Patient and date_YearMonth = cast(cast(D/100 as nvarchar) +'01' as int)

where 
	cast(left(cast(d as char),4) as int) - year([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](p.BirthDate)) > 65
	and ms.MSSPKey = 1
GROUP BY F.id_Patient,code
order by 1,2,3 asc
;

--select *--distinct Id_Patient, max(date_YearMonth)
--from fact.MSSP
--where MSSPKey = 1
--group by Id_Patient








