EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR;

-- amb visit
select distinct id_patient, min(fromdate_min) fromdate, max(cast(cast(to_date/100 as nvarchar) + '01' as int)) todate
 from 
(

   -- EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR;

-- amb visit
select qq.*
from 
(SELECT id_Patient
,		125 indicatorId
	,MIN(date_Visit) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class
	
	,1 	CountInt
	,1 IsPrimary
	,To_Date =(date_Visit / 10000)* 10000 + 1231
	,date_Visit / 10000 Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
FROM Fact.AmbulatoryVisits AV
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (date_Visit / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
			and [DateOfDeath] is null
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[ConditionPatient] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,date_Visit / 10000

UNION

 -- gv claims
SELECT id_Patient
,Act.IndicatorId  
	,MIN(date_Action) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class	
	,1 	CountInt
	,1 IsPrimary
	,To_Date  =(date_Action / 10000)* 10000 + 1231
	,date_Action / 10000  Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
FROM [Fact].[Claims] AV
INNER JOIN   Factless.ValueSetMapIndicator Va
ON AV.attrib_Claim=Va.AdminCodeKey
INNER JOIN [Dim].[ActiveIndicators] ACT
ON Va.indicatorId=Act.indicatorId
AND Act.IndicatorId = 124
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (date_Action / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
			AND [DateOfDeath] IS NULL
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[ConditionPatient] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,Act.IndicatorId  
,date_Action / 10000) qq

inner join

(
-- conditions ivd since ever
SELECT id_Patient
,Act.IndicatorId  
	,MIN(av.date_ConditionStart) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class
	
	,1 	CountInt
	,1 IsPrimary
	,To_Date  =(av.date_ConditionStart / 10000)* 10000 + 1231
	,av.date_ConditionStart / 10000  Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
FROM fact.conditions AV
INNER JOIN   Factless.ValueSetMapIndicator Va
ON AV.attrib_ConditionCode = Va.AdminCodeKey
INNER JOIN [Dim].[ActiveIndicators] ACT
ON Va.indicatorId=Act.indicatorId
AND Act.IndicatorId in (116)
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
and av.attrib_ConditionClass in (3,4) -- diagnosis Or problem
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (av.date_ConditionStart / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
			AND [DateOfDeath] IS NULL
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[ConditionPatient] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,Act.IndicatorId  
,av.date_ConditionStart / 10000


union

select timezonediff.id_Patient
	,IndicatorId  
	,FromDate_Min
	,FromDate_Max
	,Indicator_Class	
	,CountInt
	,IsPrimary
	,To_Date
	,Indicator1
	,Indicator2
	,Indicator3
	,Date1
	,Date2
from 
(
 -- conditions
SELECT id_Patient
,Act.IndicatorId  
	,MIN(av.date_ConditionStart) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class	
	,1 	CountInt
	,1 IsPrimary
	,To_Date  =(av.date_ConditionStart / 10000)* 10000 + 1231
	,av.date_ConditionStart / 10000  Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
	,av.id_Encounters

FROM fact.conditions AV
INNER JOIN   Factless.ValueSetMapIndicator Va
ON AV.attrib_ConditionCode = Va.AdminCodeKey
INNER JOIN [Dim].[ActiveIndicators] ACT
ON Va.indicatorId=Act.indicatorId
AND Act.IndicatorId in (117,120,123)
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
and date_ConditionStart != -1 and date_ConditionStart is not null
and av.attrib_ConditionClass in (3) -- diagnosis
and av.measure_IsPrimary = 1 -- must be Primary
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (av.date_ConditionStart / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
			AND [DateOfDeath] IS NULL
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[ConditionPatient] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,Act.IndicatorId  
,av.date_ConditionStart / 10000
,id_Encounters

UNION

 -- procedure
SELECT id_Patient
,Act.IndicatorId  
	,MIN(av.date_Start) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class	
	,1 	CountInt
	,1 IsPrimary
	,To_Date  =(av.date_Start / 10000)* 10000 + 1231
	,av.date_Start / 10000  Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
	,av.id_Encounter id_Encounters
FROM fact.Procedures AV
INNER JOIN   Factless.ValueSetMapIndicator Va
ON AV.attrib_Procedure = Va.AdminCodeKey
INNER JOIN [Dim].[ActiveIndicators] ACT
ON Va.indicatorId=Act.indicatorId
AND Act.IndicatorId in (119,122)
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
and date_Start != -1 and date_Start is not null
AND [dbo].[IsCode]([attrib_Mood],'ActMood','EVN')=1
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (av.date_Start / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
			AND [DateOfDeath] IS NULL
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[ConditionPatient] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,Act.IndicatorId  
,av.date_Start / 10000
,av.id_Encounter

UNION

 -- claims
SELECT id_Patient
,Act.IndicatorId  
	,MIN(date_Action) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class	
	,1 	CountInt
	,1 IsPrimary
	,To_Date  =(date_Action / 10000)* 10000 + 1231
	,date_Action / 10000  Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
	,-7 id_Encounters
FROM [Fact].[Claims] AV
INNER JOIN   Factless.ValueSetMapIndicator Va
ON AV.attrib_Claim=Va.AdminCodeKey
INNER JOIN [Dim].[ActiveIndicators] ACT
ON Va.indicatorId=Act.indicatorId
AND  act.IndicatorId in (118,121)
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
and date_Action != -1 and date_Action is not null
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (date_Action / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
			AND [DateOfDeath] IS NULL
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[ConditionPatient] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,Act.IndicatorId  
,date_Action / 10000
) timezonediff

inner join fact.Admissions fad
on (fad.id_Admission = timezonediff.id_Encounters or timezonediff.id_Encounters = -7)
and fad.id_Patient = timezonediff.id_Patient

) q

on (q.id_Patient = qq.id_Patient and qq.Indicator1 = q.Indicator1 + 1)
	or
	(q.id_Patient = qq.id_Patient and q.IndicatorId = 116 )











union


-- medication relevant for IVD mssp 

SELECT 
id_Patient
	,Act.IndicatorId  
	,MIN(av.date_Order) FromDate_Min
	,NULL FromDate_Max
	,NULL Indicator_Class	
	,1 	CountInt
	,1 IsPrimary
	,To_Date  =(av.date_Order / 10000)* 10000 + 1231
	,av.date_Order / 10000  Indicator1
	,NULL Indicator2
	,NULL Indicator3
	,NULL Date1
	,NULL Date2
--*
FROM [Fact].[MedicationOrders] AV
INNER JOIN   Factless.ValueSetMapIndicator Va
ON AV.[attrib_Medication] = Va.AdminCodeKey
INNER JOIN [Dim].[ActiveIndicators] ACT
ON Va.indicatorId=Act.indicatorId
AND Act.IndicatorId in (126)
WHERE dbo.IsCancelled(AV.attrib_Status) = 0
and date_Order != -1 and date_Order is not null
	
	AND EXISTS (
		SELECT TOP 1 (1)
		FROM Dim.Patients P
		WHERE P.PatientKey = AV.id_Patient
			AND (av.date_Order / 10000 - YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(BirthDate))) >= 18
		)
		AND EXISTS (
		SELECT TOP 1 (1)
		FROM dbmSemanticAnalyticsSTG.[STG].[TmpFactsPatients] Dp
		WHERE  AV.id_Patient = DP.PatientKey
	AND DP.[TableId]in(4,11,1,3,14))
GROUP BY id_Patient
,Act.IndicatorId  
,av.date_Order / 10000
) final

group by id_patient
order by 1,2,3
