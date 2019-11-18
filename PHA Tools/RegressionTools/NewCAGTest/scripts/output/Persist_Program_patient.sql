
EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR

SELECT DISTINCT Patient_Root
	,Patient_Ext
	,Id_Program
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(From_DateEnc) From_DateEnc
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(To_DateEnc) To_DateEnc
	
	--,lastUpdated
FROM dbmSemanticAnalyticsSTG.Persist.FactPatientProgramRelations

ORDER BY 
	 1,2,3,4,5

