--Actual--

SELECT  [date_YearMonth]
      ,[attrib_Measure]
      ,[attrib_PatientAge]
      ,[numerator]
	  --,D.InverseInd
	  --,denumerator
  FROM [dbmSemanticAnalytics].[Fact].[KpiSummMonthly] K
  left join  [dbmSemanticAnalytics].[Dim].[MeasureDefinition] D ON K.attrib_Measure = D.MeasureKey
  where date_YearMonth =  cast( datepart(yyyy,getdate())as varchar)+'_01'
 and attrib_Org = -2
 and attrib_PatientAge > -2
 and attrib_Provider = -2
  AND Severity_Score=-2
  AND Gender=-2
  and k.attrib_Program = -2
 and [numerator] > 0
 order by 2,3