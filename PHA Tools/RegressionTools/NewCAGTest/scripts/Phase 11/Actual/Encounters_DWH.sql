EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR 
USE [dbmSemanticAnalytics]
Go 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Set nocount on

SELECT --id_Encounter,
	Encounter_root
	,Encounter_Ext
	,SourceSystemId_Root
	,SourceSystemId_Extension
	,Patient_Root
	--,Patient_Ext
	,[dbmSemanticAnalyticsSTG].[dbo].[DecryptHRlong](Enc_Extension) as Patient_Ext 
	,AssignedOrg_Root
	,AssignedOrg_Ext
	,ReferrerOrg_Root
	,ReferrerOrg_Ext
	,ReferringPhysician_Root
	,ReferringPhysician_Ext
	,DischargingPhysician_Root
	,DischargingPhysician_Ext
	,AdmittingPhysician_Root
	,AdmittingPhysician_Ext
	,AttendingPhysician_Root
	,AttendingPhysician_Ext
	,dbmSemanticAnalyticsSTG.dbo.Convert_Date(AdmissionDate) as AdmissionDate
	,dbmSemanticAnalyticsSTG.dbo.Convert_Date(DischargeDate) as DischargeDate
	,AdmissionStatusCode
	,AdmissionStatusCodeSystem
	,AdmissionPriorityCode
	,AdmissionPriorityCodeSystem
	,DischargeDispositionCode
	,DischargeDispositionCodeSystem
	,AdmissionReferralSourceCode
	,AdmissionReferralSourceCodeSystem
	,DischargeDiagnosisPrimaryCode
	,DischargeDiagnosisPrimaryCodeSystem
	,AdmissionDiagnosisPrimaryCode
	,AdmissionDiagnosisPrimaryCodeSystem
	,EncounterCode
	,EncounterCodeSystem
	--,LastUpdated
	--,NodeID
	--,FlagNew
	--,dbmAvailabilityTime
	,FlagDelete
	,Type
	--,sys_PartitionDate
FROM [dbmSemanticAnalyticsSTG].Persist.FactEncounters FE
								join [dbmSemanticAnalyticsSTG].Persist.MappingPatient MP
								on FE.Patient_Ext = MP.Id_Extension
								and FE.Patient_Root = MP.Id_Root
WHERE (FE.Encounter_Ext LIKE N'PHA_EncAT_enc%')
ORDER BY Encounter_Ext

--CREATE TABLE #Enc (id_Encounter INT,Encounter_Ext nvarchar (255))

--INSERT INTO #Enc (id_Encounter,Encounter_Ext)
--SELECT id_Encounter, Encounter_Ext
--FROM [dbmSemanticAnalyticsSTG].Persist.FactEncounters
--WHERE (Encounter_Ext LIKE N'PHA_EncAT_enc%')

--SELECT 
--	--id_Admission
--	Encounter_Ext
--	,P.[FullName] id_Patient
--	, OA.[level3] org_Assigned
--	,OD.level3 org_DischargingUnit
--	,ORF.level3 org_Referring
--	, ORP.level3 [org_RelatedProvider]
--	,CR.FullName provider_Referring
--	,CA.FullName provider_Admitting
--	,CD.FullName provider_Discharging
--	,CRT.FullName provider_Related
--	,ATND.FullName provider_Attending
--	,date_Admission
--	,date_AdmissionTime
--	,date_Discharge
--	,date_DischargeTime
--	--,attrib_Status
--	--,attrib_Priority
--	--,attrib_EncounterType
--	--,attrib_DischargingServiceLine
--	--,attrib_DischargeDisposition
--	--,attrib_AdmissionReferralSource
--	--,attrib_AdmissionDiagnosisPrimary
--	--,attrib_DischargeDiagnosisPrimary
--	--,attrib_SourceSystem
--	--,attrib_PatientResidency
--	--,attrib_PatientAge
--	,CASE
--	WHEN date_Discharge IS NULL
--	THEN 0
--	ELSE
--	range_LOS
--	END
--	AS range_LOS
--	,measure_AdmissionInd
--	,measure_DischargeInd
--	,measure_OpenAdmissionInd
--	,mesure_UrgentAdmissionInd
--	,measure_DeathInd
--	,CASE
--	WHEN date_Discharge IS NULL
--	THEN 0
--	ELSE
--	measure_LengthOfStay
--	END measure_LengthOfStay
--	,CASE
--	WHEN date_Discharge IS NULL
--	THEN 0
--	ELSE
--	measure_AgeInDays
--	END measure_AgeInDays
--	--,sys_PartitionDate
--FROM [Fact].[Admissions] A
--INNER JOIN #Enc E ON A.id_Admission = E.id_Encounter
--Inner JOIN [Dim].[Patients] P
--ON A.id_Patient=P.[PatientKey]
--INNER JOIN [Dim].[Organizations] OA
--ON A.org_Assigned=OA.[OrganizationKey]
--INNER JOIN [Dim].[Organizations] OD
--ON A.org_DischargingUnit=OD.[OrganizationKey]
--INNER JOIN [Dim].[Organizations] ORF
--ON A.org_Referring=ORF.[OrganizationKey]
--INNER JOIN [Dim].[Organizations] ORP
--ON A.org_RelatedProvider=ORP.[OrganizationKey]
--INNER JOIN [Dim].[CareProviders] CR
--ON A.provider_Referring=CR.CareProviderKey
--INNER JOIN [Dim].[CareProviders] CA
--ON A.provider_Admitting=CA.CareProviderKey
--INNER JOIN [Dim].[CareProviders] CD
--ON A.provider_Discharging=CD.CareProviderKey
--INNER JOIN [Dim].[CareProviders] ATND
--ON A.provider_Attending=ATND.CareProviderKey
--INNER JOIN [Dim].[CareProviders] CRT
--ON A.provider_Related=CRT.CareProviderKey
--ORDER BY Encounter_Ext

--SELECT
-- --id_AmbulatoryVisit
-- Encounter_Ext
--	,P.[FullName]
--	, OA.[level3] org_Assigned
--	,OD.level3 org_Unit
--	,ORF.level3 org_Referring
--	,CR.FullName provider_Referring
--	,CA.FullName provider_Attending
--	,CRT.FullName provider_Related,
--	date_Visit
--	,date_VisitTime
--	--,attrib_Status
--	--,attrib_Priority
--	--,attrib_EncounterType
--	--,attrib_ServiceLine
--	--,attrib_DischargeDisposition
--	--,attrib_ReferralSource
--	--,attrib_VisitDiagnosisPrimary
--	--,attrib_SourceSystem
--	--,attrib_PatientResidency
--	--,attrib_PatientAge
--	,measure_VisitInd
--	,measure_AgeInDays
--	--,sys_PartitionDate
--FROM [Fact].AmbulatoryVisits A
--INNER JOIN #Enc E ON A.id_AmbulatoryVisit = E.id_Encounter
--Inner JOIN [Dim].[Patients] P
--ON A.id_Patient=P.[PatientKey]
--INNER JOIN [Dim].[Organizations] OA
--ON A.org_Assigned=OA.[OrganizationKey]
--INNER JOIN [Dim].[Organizations] OD
--ON A.org_Unit=OD.[OrganizationKey]
--INNER JOIN [Dim].[Organizations] ORF
--ON A.org_Referring=ORF.[OrganizationKey]

--INNER JOIN [Dim].[CareProviders] CR
--ON A.provider_Referring=CR.CareProviderKey
--INNER JOIN [Dim].[CareProviders] CA
--ON A.provider_Attending=CA.CareProviderKey


--INNER JOIN [Dim].[CareProviders] CRT
--ON A.provider_Related=CRT.CareProviderKey
--ORDER BY Encounter_Ext

--SELECT 
----EncounterId,
--Encounter_Ext,
--	EncounterStartDate
--	,EncounterEndDate
--	,EncounterStartTime
--	,EncounterEndTime
--	,EncounterClass
--	--,EncounterType
--	--,DischargeDiagnosisPrimaryKey
--	,DischargeDiagnosisPrimaryDesc
--FROM DIM.Encounters A
--INNER JOIN #Enc E ON A.EncounterId = E.id_Encounter
--ORDER BY Encounter_Ext

--DROP TABLE #Enc
