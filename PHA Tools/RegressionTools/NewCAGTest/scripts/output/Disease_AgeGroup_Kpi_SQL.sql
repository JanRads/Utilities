   use [dbmSemanticAnalytics]
go 
with s1 as (

SELECT
		[attrib_Org]
		,[attrib_Measure]
	   , ag.AgeGroupDesc
      ,cast ([kpi_score]   as float) *100 as [kpi_score] 
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly] kpi
    join [Dim].[AgeGroups] ag
  on ag.AgeGroupKey = kpi.attrib_PatientAge 


  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01' 
  and [attrib_Measure] <-2
  and [attrib_Provider] = -2
  --and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and [attrib_Org] = -2
  and attrib_Program = -2
  )

   , s2 as 
   (select distinct - [MeasureLevel2Key] as forjoin  ,  [MeasureLevel2Desc] from   [Dim].[MeasureDefinition])
     select s2.MeasureLevel2Desc , AgeGroupDesc , s1.kpi_score   from  s1 inner join s2 on s2.forjoin  = s1.attrib_Measure

   order by 1,2




