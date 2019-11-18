SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_WARNINGS OFF
go
SET NOCOUNT ON
SELECT Year_Month, 
       measure_IndexAdmissionInd, 
       measure_Fuv7Ind, 
      -- measure_Fuv30Ind, 
       CAST(CAST(CASE 
                   WHEN measure_Fuv7Ind = 0 THEN 0.0 
                   ELSE measure_Fuv7Ind * 1.0 / measure_IndexAdmissionInd 
                 END AS VARCHAR(14)) AS VARCHAR(4)) AS measure_Fuv7Rate--, 
       --CAST(CAST(CASE 
       --            WHEN measure_Fuv30Ind = 0 THEN 0.0 
       --            ELSE measure_Fuv30Ind * 1.0 / measure_IndexAdmissionInd 
       --          END AS VARCHAR(14)) AS VARCHAR(4)) AS measure_Fuv30Rate 
FROM   (SELECT CAST(D.monthyeardesc AS VARCHAR(6))      AS Year_Month, 
               ISNULL(SUM(mesure_IndexAdmissionInd), 0) AS measure_IndexAdmissionInd, 
               ISNULL(SUM(measure_FUV_7Day_Ind), 0)     AS measure_Fuv7Ind, 
               ISNULL(SUM(measure_FUV_30Day_Ind), 0)    AS measure_Fuv30Ind, 
               LEFT(date_dischargeindexadmission, 6)    TempDate 
        FROM   [dbmSemanticAnalytics].FACT.READMISSIONS Re 
               LEFT JOIN [dbmSemanticAnalytics].DIM.[DATES] D 
                      ON Re.date_dischargeindexadmission = D.datekey 
        GROUP  BY D.monthyeardesc, 
                  LEFT(date_dischargeindexadmission, 6))T 
WHERE  T.Year_Month IS NOT NULL 
ORDER  BY T.TempDate 