select ConditionId_Root, ConditionId_Extension, 
 PatientId_Root, PatientId_Extension, 
 EncounterId_Root, EncounterId_Extension, 
 ConditionCode, ConditionCodeSystem,  
 ConditionClassIndicator,
  ConditionTypeCode, ConditionTypeCodeSystem,
   IsPrimary
from	(
 select ROW_NUMBER() OVER (Partition BY ConditionId_Root, ConditionId_Extension ORDER BY [ID] Desc)  RN,
  [ID], ConditionId_Root, ConditionId_Extension, 
 PatientId_Root, PatientId_Extension, 
 EncounterId_Root, EncounterId_Extension, 
  AssignedOrgId_Root, AssignedOrgId_Extension, 
  StartDate, EndDate, 
  ConditionCode, ConditionCodeSystem,  
 ConditionClassIndicator,
  ConditionTypeCode, ConditionTypeCodeSystem,
  DeleteKey,
  IsPrimary

FROM dbmClinicalAnalyticsGateway.Fact.Conditions) C

where C.PatientId_Extension like 'PHA%'
AND EXISTS (SELECT TOP(1) 1 FROM dbmClinicalAnalyticsGateway.[MasterData].[PatientIdentifier] P
WHERE C.PatientId_Extension=P.[PatientId_Extension]
AND C.PatientId_Root=P.PatientId_Root)
and rn = 1 and C.DeleteKey <> 1
--and ConditionId_Extension <>'PHA_Relat_EncAT_Cond4'
order by ConditionId_Root, ConditionId_Extension



