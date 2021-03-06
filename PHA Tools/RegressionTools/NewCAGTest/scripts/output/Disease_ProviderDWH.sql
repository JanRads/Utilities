-- 100
SELECT 
      M.MeasureLevel2Desc
      ,[attrib_Provider]
      ,cast(round(sum(KPI_Score),2) as money)*100 as KPIScore   
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly] K
  left join (select distinct [MeasureLevel2Key] , [MeasureLevel2Desc]     from  [dbmSemanticAnalytics].[Dim].[MeasureDefinition] ) M
    on K.attrib_Measure = (-M.[MeasureLevel2Key])
 where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
  and [attrib_Measure] <-2  
  and [attrib_Measure]<> -99
  and [attrib_Provider] <> -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2 
  and [attrib_Org] = -2
  and [attrib_Program] = -2
  group by M.MeasureLevel2Desc,[attrib_Provider]
  order by M.MeasureLevel2Desc,[attrib_Provider]




