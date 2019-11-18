USE [dbmSemanticAnalytics]
GO


SELECT 
	 [id_Condition]
	,[id_Patient]
	,[attrib_ConditionCode]
	,[ConditionStartDateEnc]
	,[ConditionEndDateEnc]
	,[Original_ClaimID]
	,[Flag_Claims]    
FROM [Fact].[Conditions]
where  [Original_ClaimID] is not null 
--and 
--Flag_Claims=1                   ------------------------------------------------------------------------------------
--                                -- need to remove this condition after fixing Persist dim admincodes duplicate rows 
		                        ------------------------------------------------------------------------------------  
order by 1