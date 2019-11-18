/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  cast (case when cast (Gender as varchar (1)) = 1 then 'F' WHEN cast(Gender as varchar (1)) = 2 THEN 'M' ELSE cast (Gender as varchar (1)) END as varchar (500)) as [Gender]
,cast(round(sum(KPI_Score),2) as money)*100 as KPIScore
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly]
  
  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
  and [attrib_Measure] =-99
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] <> -2 
  and [attrib_Org] = -2
  and attrib_Program = -2
  group by Gender

