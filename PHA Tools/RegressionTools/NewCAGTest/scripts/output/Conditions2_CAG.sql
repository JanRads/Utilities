select ConditionId_Root, ConditionId_Extension, 
 PatientId_Root, PatientId_Extension, 
 EncounterId_Root, EncounterId_Extension, 
  --AssignedOrgId_Root, AssignedOrgId_Extension, 
  ConditionCode, ConditionCodeSystem,  
 ConditionClassIndicator,
  ConditionTypeCode, ConditionTypeCodeSystem,
   IsPrimary
--select *
from	(
select [ID], ConditionId_Root, ConditionId_Extension, 
 PatientId_Root, PatientId_Extension, 
 EncounterId_Root, EncounterId_Extension, 
  AssignedOrgId_Root, AssignedOrgId_Extension, 
  --PerformerId_Root, PerformerId_Extension, 
  StartDate, EndDate, 
  ConditionCode, ConditionCodeSystem,  
 ConditionClassIndicator,
  ConditionTypeCode, ConditionTypeCodeSystem,
  IsPrimary,
  ROW_NUMBER() OVER (Partition BY ConditionId_Root, ConditionId_Extension ORDER BY [ID] Desc) as RN
from
(
SELECT *
FROM dbmClinicalAnalyticsGateway.Fact.Conditions
)A 
)t WHERE t.rn = 1 AND PatientId_Extension like 'PHA%' 
and ConditionId_Extension not in (
SELECT distinct ConditionId_Extension
FROM dbmClinicalAnalyticsGateway.Fact.Conditions
WHERE DeleteKey = 1)
--AND PatientId_Extension like 'PHA%')
order by ConditionId_Root, ConditionId_Extension
