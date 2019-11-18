USE [dbmSemanticAnalytics]
GO

SET ANSI_WARNINGS OFF
SET NOCOUNT ON
DECLARE @LDDate INT
       ,@EndDate INT
       ,@EndMonth varchar(8)
       ,@Now DATE
       ,@SDate DATE
       ,@LDDate1 DATE

SELECT @Now = getdate()

SELECT @EndDate = YEAR(@Now) * 10000 + Month(@Now) * 100 + 01



SELECT @SDate = [dbmSemanticAnalyticsSTG].[dbo].[UnConvert_Date](@EndDate)

SELECT @LDDate1 = dateadd(dd, - 1, @Sdate) --datetype

SELECT @LDDate = [dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](@LDDate1) -- 

SELECT @EndMonth=[MonthYear]
FROM  [Dim].[Dates]
WHERE [DateKey]=@LDDate



SELECT A.IndicatorName,
ISNULL(CAST (Result as varchar(20)),'')as Result
FROM
(SELECT       cast(IndicatorName AS VARCHAR(20))   IndicatorName
FROM            Dim.ActiveIndicators
WHERE        (IndicatorId BETWEEN 1 AND 17)) A
LEFT OUTER JOIN
(
SELECT cast(Disease_name AS VARCHAR(20)) AS Indicators
       ,Count(*) AS Result
FROM (
       SELECT *
       FROM (
              SELECT *
              FROM fact.Admissions
              WHERE date_Discharge != - 1
                     --and org_RelatedProvider != -1
              ) T1
       WHERE Dateadd(year, 1, dbmSemanticAnalyticsSTG.dbo.Unconvert_date(date_Discharge)) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
              AND dbmSemanticAnalyticsSTG.dbo.Unconvert_date(date_Discharge) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
              AND EXISTS (
                     SELECT *
                     FROM factless.PATIENTRELATIONSFROMTO T2
                     WHERE T2.id_patient = T1.id_patient
                           AND org_relatedprovider != - 1
                           AND dbmSemanticAnalyticsSTG.dbo.Unconvert_date(date__from_relationship) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                           AND dbmSemanticAnalyticsSTG.dbo.Unconvert_date(date_to_relationship) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                     )
       ) T1
INNER JOIN (
       SELECT T2.id_Patient
              ,T5.Disease_name
       FROM [Fact].[SeverityScores] AS T2
       INNER JOIN Dim.Comb_Inds AS T3 ON T2.Comb_id = T3.Comb_id
       INNER JOIN [dbmSemanticAnalytics].[Dim].[Comb_Diseases] AS T5 ON T5.Comb_id = t3.Comb_id
       WHERE t2.Comb_id > 0
       AND [ScoreType]='MCC Score'
       AND [date_YearMonth]=@EndMonth
       ) t4 ON t1.id_Patient = t4.Id_Patient
GROUP BY Disease_name) B
ON A.IndicatorName=B.Indicators
ORDER BY A.IndicatorName

