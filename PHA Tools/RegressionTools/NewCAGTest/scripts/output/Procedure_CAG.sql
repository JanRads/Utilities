
SET ANSI_WARNINGS OFF 
go 
SET NOCOUNT ON 
go 
SELECT  ProcedureId_Root, ProcedureId_Extension, PatientId_Root, PatientId_Extension, ProcedureCode, ProcedureCodeSystem, 
       
		   cast(convert(char(12), ProcedureStartDate, 113) as datetime) As ProcedureStartDate, 
		    cast(convert(char(12), ProcedureEndDate, 113) as datetime) As ProcedureEndDate, 
						 
					  StatusCode, StatusCodeSystem
--FROM [dbmClinicalAnalyticsGateway].[Fact].[Procedures]
--where ProcedureCode  = '429400009'
--ORDER BY 2
from
(SELECT row_number() over (partition by [ProcedureId_Extension] order by ID desc) rn ,
		*
  FROM [dbmClinicalAnalyticsGateway].[Fact].[Procedures]
  )q
  where rn = 1 and DeleteKey <> 1
  order by 2

