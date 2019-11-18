SELECT 
      B.[MeasureLevel2Desc],
        -- Gender 
          case when cast (Gender as varchar (1)) = 1 then 'F' WHEN cast(Gender as varchar (1)) = 2 THEN 'M' ELSE cast (Gender as varchar (1)) END as [Gender]
      ,cast(round(sum(KPI_Score),3) as money) as KPIScore  
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]A
  left join (select distinct [MeasureLevel2Key] , [MeasureLevel2Desc]     from  [dbmSemanticAnalytics].[Dim].[MeasureDefinition] )  B
  on A.attrib_Measure =  (-B.[MeasureLevel2Key]) 
  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
  and [attrib_Measure]  < -2 
  and [attrib_Measure]<> -99
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and attrib_Program = -2
  and [Gender] <> -2  
  and [attrib_Org] = -2
  group by B.[MeasureLevel2Desc] ,[Gender]
  order by 1 ,2
