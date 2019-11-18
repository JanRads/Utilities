
SELECT 
      [attrib_Measure]
      ,[attrib_Org]
   ,cast ([kpi_score]   as decimal(5,4)) as [kpi_score]
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]
    where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01' 
  and [attrib_Measure] > 0 
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and [attrib_Org] <> -2
  and attrib_Program = -2
  order by 1,2