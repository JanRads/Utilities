/****** Script for SelectTopNRows command from SSMS  ******/
SELECT   cast (A.[AgeGroupDesc] as varchar (7)) as [AgeGroupDesc]
        ,cast ([attrib_Measure] as varchar (100))as [attrib_Measure]
		,cast (M.[MeasureName] as varchar (100)) as [MeasureName]
        ,cast(round(sum(KPI_Score),2) as money) as KPIScore
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly] K
  left join [dbmSemanticAnalytics].[Dim].[AgeGroups] A
  on K.attrib_PatientAge = A.AgeGroupKey 
  left join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] M
    on K.attrib_Measure = M.MeasureKey
  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
    and[attrib_PatientAge] > 0
    and [attrib_Measure] > 0
	and [attrib_Provider]=-2
	and [attrib_Org]= -2
	and [Severity_Score]=-2
    and [Gender]=-2
	and attrib_Program = 1
  group by  A.[AgeGroupDesc],[attrib_Measure],M.[MeasureName]
  order by  A.[AgeGroupDesc],[attrib_Measure],M.[MeasureName]
