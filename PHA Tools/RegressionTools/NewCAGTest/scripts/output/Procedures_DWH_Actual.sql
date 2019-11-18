
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

select [Procedure_Root], [Procedure_Ext], [PatientId_Root], 
 dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS  [Patient_Ext],
[ProcedureCode], [ProcedureCodeSystem],
cast(convert(char(11), dbmSemanticAnalyticsSTG.dbo.DecryptHR( pp.ProcedureStartDateEnc), 113) as datetime) As [ProcedureStartDate], 
cast(convert(char(11), dbmSemanticAnalyticsSTG.dbo.DecryptHR( pp.ProcedureEndDateEnc), 113) as datetime) As ProcedureEndDate, 
   [StatusCode], [StatusCodeSystem]

from [dbmSemanticAnalyticsSTG].[Persist].[FactProcedures] PP left join [dbmSemanticAnalytics].[Fact].[Procedures] FP on PP.[Procedure_ID]= FP.[id_Procedure] 
left  JOIN
	[dbmSemanticAnalyticsSTG].Persist.MappingPatient mp on mp.id_Extension = pp.Patient_Ext and mp.Id_Root= pp.PatientId_Root
where ProcedureCode  = '429400009'
ORDER BY 2
