use [dbmSemanticAnalytics]
go 


SELECT DISTINCT MeasureLevel2Key
    ,MeasureLevel2Desc
    ,CAST ([kpi_score] *100 as INT) [kpi_score]
    ,numerator = CASE 
		WHEN numerator IS NULL     THEN 0
		ELSE numerator             END
    --,max(denumerator) over (partition by MeasureLevel2Key) maxi
	,denumerator
                
                  
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly] KPI 
  JOIN  ( select distinct MeasureLevel2Key , MeasureLevel2desc from  [Dim].[MeasureDefinition]  )Md
  ON -KPI.attrib_Measure = MD.MeasureLevel2Key

  where [date_YearMonth] = cast( datepart(yyyy,getdate())as varchar)+'_01'
  and [attrib_Measure] between -98 and -2
  and [attrib_Provider] = -2
  and [attrib_PatientAge] = -2
  and [Severity_Score] = -2
  and [Gender] = -2  
  and [attrib_Org] = -2
  and attrib_Program = -2




order by 1,2