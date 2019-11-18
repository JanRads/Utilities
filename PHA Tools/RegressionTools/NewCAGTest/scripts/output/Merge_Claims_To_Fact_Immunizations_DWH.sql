--Actual
USE [dbmSemanticAnalytics]
GO


SELECT 
	  id_Immunization
	,[id_Patient]
	,ImmunizationsClaimCodeKey
	,[attrib_ImmunizationCode]
	,ImmunizationStartDateEnc
	,ImmunizationEndDateEnc
	,[Original_ClaimID]
	,[Flag_Claims]
     
FROM [Fact].Immunizations
where  [Original_ClaimID] <> -1 
	 AND               
		 Flag_Claims = 0        
order by 1