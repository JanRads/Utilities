SET ANSI_WARNINGS OFF

select cast(D.MonthYearDesc as varchar(6)) as Year_Month , 1.00 AS LOS_out_numerator ,  LOS_out_denumerator as LOS_out_denumerator ,   cast(numerator /24 as decimal(5,2)) as LOS_out_score from (

SELECT        [dbmSemanticAnalytics].[Dim].[Dates].MonthYear, avg(cast([measure_LengthOfStay_IndexAdm] as numeric) ) AS numerator , count(*) as  LOS_out_denumerator
FROM            [dbmSemanticAnalytics].[Fact].[Readmissions] INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Dates] ON [dbmSemanticAnalytics].[Fact].[Readmissions].date_DischargeIndexAdmission = [dbmSemanticAnalytics].[Dim].[Dates].DateKey INNER JOIN
                         [dbmSemanticAnalytics].[Dim].[Organizations] ON [dbmSemanticAnalytics].[Fact].[Readmissions].org_RelatedProvider_IndexAdm = [dbmSemanticAnalytics].[Dim].[Organizations].OrganizationKey
WHERE        ([dbmSemanticAnalytics].[Dim].[Organizations].level3Id <> - 1  or [sys_PartitionDate] is null)
GROUP BY  [dbmSemanticAnalytics].[Dim].[Dates].MonthYear)   T , (select distinct MonthYear , MonthYearDesc from [dbmSemanticAnalytics].[Dim].[Dates]) D where T.MonthYear = D.MonthYear


ORDER BY D.MonthYear