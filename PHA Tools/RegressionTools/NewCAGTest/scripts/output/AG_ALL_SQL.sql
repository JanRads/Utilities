use [dbmSemanticAnalytics]
go 

SELECT 
	   ag.AgeGroupDesc
      ,cast ([kpi_score]  as decimal(5,4))*100  as [kpi_score]
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly] KPI
  join [Dim].[AgeGroups] ag
  on ag.AgeGroupKey = kpi.attrib_PatientAge

  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01' 
  and [attrib_Measure] =-99
  and [attrib_Provider] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and [attrib_Org] = -2
  and attrib_Program = -2
