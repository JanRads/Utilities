USE [dbmSemanticAnalytics]
GO

SELECT B.MeasureLevel2Desc
       ,ISNULL(CAST(Result AS VARCHAR(10)), '') Result
FROM (
       SELECT DISTINCT cast(MeasureLevel2Desc AS VARCHAR(20))  MeasureLevel2Desc
       FROM [dbmSemanticAnalytics].[Dim].[MeasureDefinition]
       ) B
LEFT JOIN (
       SELECT cast(MeasureLevel2Desc AS VARCHAR(20)) AS MeasureLevel2Desc
              ,Count(*) AS Result
       FROM (
              SELECT *
              FROM fact.EDVISITS T1
              WHERE Dateadd(year, 1, dbmsemanticanalyticsstg.dbo.Unconvert_date(date_visit)) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                     AND EXISTS (
                           SELECT *
                           FROM factless.PATIENTRELATIONSFROMTO T2
                           WHERE T2.id_patient = T1.id_patient
                                  AND org_relatedprovider != - 1
                                  AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date__from_relationship) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                                  AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date_to_relationship) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                           )
              ) T1
       INNER JOIN (
              SELECT DISTINCT t2.Id_Patient
                     ,t3.MeasureLevel2Desc
              FROM [Fact].[Summary_Population] T2
              INNER JOIN (
                     SELECT DISTINCT MeasureLevel2Key
                           ,MeasureLevel2Desc
                     FROM [dbmSemanticAnalytics].[Dim].[MeasureDefinition]
                     ) T3 ON T2.attrib_MeasureLevel2Key = t3.MeasureLevel2Key
              ) t4 ON t1.id_Patient = t4.Id_Patient
       GROUP BY MeasureLevel2Desc
       ) A ON B.MeasureLevel2Desc = A.MeasureLevel2Desc



