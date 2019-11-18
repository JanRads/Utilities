
use [dbmSemanticAnalytics]
go 
with s1 as (SELECT 
       [attrib_Measure]
      ,[attrib_Org]
      ,cast ([kpi_score]   as decimal(5,4)) as [kpi_score]
	  ,numerator
	  ,denumerator
	  
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]

  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
  and [attrib_Measure] >0
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and [attrib_Org] = -2
  and [attrib_Program]= -2
   )

   , s2 as 
   (select distinct  MeasureName , MeasureKey 
      from   [Dim].[MeasureDefinition]   )
     select MeasureKey,MeasureName, [kpi_score] ,numerator   ,denumerator
	 from  s1 inner join s2 on s2.MeasureKey  = s1.attrib_Measure
	 
   order by 1,2

