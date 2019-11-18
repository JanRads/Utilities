Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR



SELECT 

 pc.Condition_Root AS ConditionId_Root, 
 pc.Condition_Ext AS ConditionId_Extension,
 pc.Patient_Root AS PatientId_Root,
 dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS PatientId_Extension, 
 pc.EncounterID_Root AS EncounterId_Root, 
 pc.EncounterID_Ext AS EncounterId_Extension,
 pc.ConditionCode, pc.ConditionCodeSystem, 
 pc.ConditionClASs AS ConditionClassIndicator,
 pc.ConditionTypeCode, pc.ConditionTypeCodeSystem,
 c.measure_IsPrimary as IsPrimary

FROM [dbmSemanticAnalytics].[Fact].[Conditions] c LEFT JOIN
 [dbmSemanticAnalyticsSTG].Persist.FactConditions pc on c.id_Condition=pc.ConditionKey
left  JOIN
	[dbmSemanticAnalyticsSTG].Persist.MappingPatient mp on mp.id_Extension = pc.Patient_Ext and mp.Id_Root= pc.Patient_Root
	-- and dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) like 'PHA%' 

where  dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) like 'PHA%' 
--and   pc.Condition_Ext='PHA_Relat_EncAT_Cond4'
ORDER BY 1,2

--select *
--from
--[dbmSemanticAnalyticsSTG].Persist.MappingPatient
--where PPOLId NOT Like '%CSE%' 
--order by 1


