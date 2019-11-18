use dbmSemanticAnalytics
select MeasureName
		,MeasureKey
		--,date_YearMonth
		,left( DateName( month , DateAdd( month , cast(right(date_YearMonth,2) as int) , -1 ) ),3) + '-' + right(left(date_YearMonth,4),2) Date
		,cast ([kpi_score]   as decimal(5,4)) as [kpi_score]
from [Fact].[KpiSummMonthly] Kpi
join  [Dim].[MeasureDefinition] Mea
on kpi.[attrib_Measure]= Mea.[MeasureKey]

  
  where [attrib_Org] = -2
  and [attrib_Measure] > 0 
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and attrib_Program = -2
  and left(date_YearMonth,4) = year (getdate())

   
  order by MeasureName,MeasureKey,Date
