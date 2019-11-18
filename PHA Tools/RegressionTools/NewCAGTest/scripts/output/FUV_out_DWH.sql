SET ANSI_WARNINGS OFF

select  cast(D.MonthYearDesc as varchar(6)) as Year_Month , isnull(numerator,0)  AS FUV_out_numerator, isnull(denumenator,0) as FUV_out_denumerator ,  CAST(CAST(isnull(numerator,0) AS NUMERIC)/CAST(denumenator AS NUMERIC) AS decimal (5, 2))  as FUV_out_score from (

SELECT        [dbmSemanticAnalytics].[Dim].[Dates].MonthYear, SUM( [measure_FUV_7Day_Ind]) AS numerator, SUM([dbmSemanticAnalytics].[Fact].[Readmissions].mesure_IndexAdmissionInd) 
                         AS denumenator
FROM           [dbmSemanticAnalytics].[Fact].[Readmissions] INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Dates] ON [dbmSemanticAnalytics].[Fact].[Readmissions].date_DischargeIndexAdmission = [dbmSemanticAnalytics].[Dim].[Dates].DateKey INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Organizations] ON [dbmSemanticAnalytics].[Fact].[Readmissions].org_RelatedProvider_IndexAdm = [dbmSemanticAnalytics].[Dim].[Organizations].OrganizationKey
WHERE        ([dbmSemanticAnalytics].[Dim].[Organizations].level3Id <> - 1 or   [sys_PartitionDate] is null)
GROUP BY  [dbmSemanticAnalytics].[Dim].[Dates].MonthYear)   T , (select distinct MonthYear , MonthYearDesc from [dbmSemanticAnalytics].[Dim].[Dates]) D where T.MonthYear = D.MonthYear
 and isnull(numerator,0)  + isnull(denumenator,0) >0

ORDER BY d.MonthYear