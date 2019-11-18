EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
SELECT CASE 
		WHEN T1.[bookmark] IS NULL
			THEN 0
		ELSE 1
		END Bookmark
	,CASE 
		WHEN T1.[timestamp] IS NULL
			THEN 0
		ELSE 1
		END TIMESTAMP
	,T2.encounter_ext
	,T2.encounter_root
	,t2.Patient_root
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(MP.Enc_Extension) Patient_Ext
	,t5.id_extension AssignedOrgId_Extension
	,T5.id_root AssignedOrgId_Root
	,t6.id_extension ReferringOrgId_Extension
	,T6.id_root ReferringOrgId_Root
	,LEFT(date_admission, 4) Adm_Year
	,cast(Substring(Cast(date_admission AS NVARCHAR(10)), 5, 2) AS INT) Adm_Month
	--,cast(RIGHT(date_admission, 2) AS INT)
	 ,DAY(dbmSemanticAnalyticsSTG.dbo.DecryptHR(AdmissionDateEnc)) Adm_Day
	,DATEPART(hh,(dbmSemanticAnalyticsSTG.dbo.DecryptHR(AdmissionDateEnc))) Adm_Hour
	,DATEPART(minute,(dbmSemanticAnalyticsSTG.dbo.DecryptHR(AdmissionDateEnc))) Adm_Minute
	,LEFT(date_discharge, 4) Discharge_Year
	,cast(Substring(Cast(date_discharge AS NVARCHAR(10)), 5, 2) AS INT) Discharge_Month
	,DAY(dbmSemanticAnalyticsSTG.dbo.DecryptHR(DischargeDateEnc)) Discharge_Day
	,DATEPART(hh,(dbmSemanticAnalyticsSTG.dbo.DecryptHR(DischargeDateEnc))) Discharge_Hour
	,DATEPART(minute,(dbmSemanticAnalyticsSTG.dbo.DecryptHR(DischargeDateEnc))) Discharge_Minute
FROM [dbmSemanticAnalytics].[CPM].[admissions] T1
INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[factencounters] T2 ON T1.id_admission = T2.id_encounter
	AND encounter_ext LIKE 'CPM_Enc_%'
INNER JOIN (
	SELECT *
	FROM [dbmSemanticAnalyticsSTG].persist.dimorganization
	) T5 ON T1.org_assigned = T5.organizationkeyold
INNER JOIN (
	SELECT *
	FROM [dbmSemanticAnalyticsSTG].persist.dimorganization
	) T6 ON T1.org_assigned = T6.organizationkeyold
	INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] MP
ON t2.Patient_Ext=MP.Id_Extension
AND t2.Patient_Root=MP.Id_Root
ORDER BY encounter_ext
