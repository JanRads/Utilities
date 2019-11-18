--select MeasureName
--		,left( DateName( month , DateAdd( month , cast(right(date_YearMonth,2) as int) , -1 ) ),3) + '-' + right(left(date_YearMonth,4),2) Date
--		,cast ([kpi_score]   as decimal(5,4)) as [kpi_score]
--from [Fact].[KpiSummMonthly] Kpi
--join  [Dim].[MeasureDefinition] Mea
--on kpi.[attrib_Measure]= Mea.[MeasureKey]

  
--  where [attrib_Org] = -2
--  and [attrib_Measure] <-2 
--  and [attrib_Provider] = -2
--  and [attrib_PatientAge] = -2
--  and [Severity_Score] = -2
--  and [Gender] = -2  
--  and left(date_YearMonth,4) = year (getdate())

   
--  order by MeasureName,MeasureKey,Date


  use [dbmSemanticAnalytics]
go 
with s1 as (SELECT 
       [attrib_Measure]
	   ,left( DateName( month , DateAdd( month , cast(right(date_YearMonth,2) as int) , -1 ) ),3) + '-' + right(left(date_YearMonth,4),2) Date
		,cast ([kpi_score]   as decimal(5,4)) as [kpi_score]
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]

  where [attrib_Measure] <-2
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and attrib_Program = -2
  and [attrib_Org] = -2
   and left(date_YearMonth,4) = year (getdate()))

   , s2 as 
   (select distinct - [MeasureLevel2Key] as forjoin  ,  [MeasureLevel2Desc] from   [Dim].[MeasureDefinition])
     select s2.MeasureLevel2Desc ,  s1.Date , s1.kpi_score   from  s1 inner join s2 on s2.forjoin  = s1.attrib_Measure

   order by 1,2
