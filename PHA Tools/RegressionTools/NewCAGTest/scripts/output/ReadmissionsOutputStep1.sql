/* This query is testing specific encounters - Encounter_Ext like '%read%' - 
please do not add encounters wth the prefix read, because it will cause the test to fail  */
/****** Script for SelectTopNRows command from SSMS  ******/
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

SELECT DISTINCT Pe.[Encounter_Ext] AS IndexExt
	,PeRe.[Encounter_Ext] AS ReExt
	,Fuv.[Encounter_Ext] AS FuvExt
	,Pa.PPOLId AS PatientEnterpriseID
	,OrgAssignedIndex.id_Root AS OrgAssignedIndexRoot
	,OrgAssignedIndex.id_Extension AS OrgAssignedIndexExt
	,OrgAssignedRe.id_Root AS OrgAssignedReRoot
	,OrgAssignedRe.id_Extension AS OrgAssignedReExt
	,OrgRelatedIndex.id_Root AS OrgRelatedIndexRoot
	,OrgRelatedIndex.id_Extension AS OrgRelatedIndexExt
	,OrgRelatedRe.id_Root AS OrgRelatedReRoot
	,OrgRelatedRe.id_Extension AS OrgRelatedReExt
	,ProviderAttendingIndex.PPOLId AS ProviderAttendingIndexEnterpriseID
	,ProviderAttendingRe.PPOLId AS ProviderAttendingReEnterpriseID
	,ProviderRelatedIndex.PPOLId AS ProviderRelatedIndexEnterpriseID
	,ProviderRelatedRe.PPOLId AS ProviderRelatedReEnterpriseID
	,date_IndexAdmission
	,date_DischargeIndexAdmission
	,Convert(datetime,[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](Fuv.[AdmissionDateEnc]),101) AS fuvDate
	,date_Readmission
	,date_DischargeReadmission
	,attrib_Cohort
	,attrib_DeathDuringReadmissionInd
	,attrib_SameDischargeFacilityInd
	,range_LOS_IndexAdmission
	,range_TimeToFUV
	,range_LOS_Readmission
	,range_TimeBetweenAdmissions
	,mesure_IndexAdmissionInd
	,measure_ReadmissionInd
	,measure_LengthOfStay_IndexAdm
	,measure_LengthOfStay_Readmission
	,measure_TimeBetweenAdmissions
	,measure_FUV_7Day_Ind
	,measure_FUV_30Day_Ind
	,measure_TimeToFUV
	,Re.sys_PartitionDate
FROM [dbmSemanticAnalytics].[Fact].[Readmissions] Re
INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] Pe ON Re.id_IndexAdmission = Pe.id_Encounter
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] PeRe ON Re.id_Readmission = PeRe.id_Encounter
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] Fuv ON Re.id_FUV = fuv.id_Encounter
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] Pa ON Re.id_Patient = Pa.PatientKey
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[DimOrganization] OrgAssignedIndex ON Re.org_Assigned_IndexAdm = OrgAssignedIndex.OrganizationKeyold
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[DimOrganization] OrgAssignedRe ON Re.org_Assigned_Readm = OrgAssignedRe.OrganizationKeyold
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[DimOrganization] OrgRelatedIndex ON Re.org_RelatedProvider_IndexAdm = OrgRelatedIndex.OrganizationKeyold
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[DimOrganization] OrgRelatedRe ON Re.org_RelatedProvider_Readm = OrgRelatedRe.OrganizationKeyold
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingProvider] ProviderAttendingIndex ON Re.provider_Admitting_IndexAdm = ProviderAttendingIndex.CareProviderKey
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingProvider] ProviderAttendingRe ON Re.provider_Admitting_Readm = ProviderAttendingRe.CareProviderKey
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingProvider] ProviderRelatedIndex ON Re.provider_Related_IndexAdm = ProviderRelatedIndex.CareProviderKey
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingProvider] ProviderRelatedRe ON Re.provider_Related_Readm = ProviderRelatedRe.CareProviderKey
WHERE PE.Encounter_Ext LIKE '%read%'
	AND OrgAssignedIndex.id_Root IS NOT NULL
