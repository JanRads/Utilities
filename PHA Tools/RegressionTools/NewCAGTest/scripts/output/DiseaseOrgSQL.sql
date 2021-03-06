/****** Script for SelectTopNRows command from SSMS  ******/
use [dbmSemanticAnalytics]
go 
with s1 as (SELECT 
       [attrib_Measure]
      ,[attrib_Org]
      ,cast ([kpi_score]   as decimal(5,4))*100 as [kpi_score]
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]

  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01' 
  and [attrib_Measure] <-2
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and attrib_Program = -2
  and [Gender] = -2  and [attrib_Org] <> -2)

   , s2 as 
   (select distinct - [MeasureLevel2Key] as forjoin  ,  [MeasureLevel2Desc] from   [Dim].[MeasureDefinition])
     select s2.MeasureLevel2Desc ,  s1.attrib_Org , s1.kpi_score   from  s1 inner join s2 on s2.forjoin  = s1.attrib_Measure

   order by 1,2

