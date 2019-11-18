use [dbmSemanticAnalytics]
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;
SELECT T2.Id_Extension, 
 T3.Encounter_Ext ,
       T1.Severity_Score, 
       T1.ScoreType, 
       T1.date_Score
FROM   FACT.SeverityScores T1 
       INNER JOIN (SELECT PatientKey, 
                          [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR]([Enc_Extension]) Id_Extension 
                   FROM   dbmSemanticAnalyticsSTG.PERSIST.MappingPatient 
                   WHERE  [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR]([Enc_Extension]) LIKE '%LACE%') T2 
               ON T1.Id_Patient = T2.PatientKey 
       INNER JOIN dbmSemanticAnalyticsSTG.PERSIST.factEncounters T3 
               ON T1.id_IndexAdmission = T3.id_Encounter 
WHERE  T1.ScoreType IN ( 'LACE Score', 'Charlson Score' ) 
ORDER  BY Id_Extension, 
		Encounter_Ext,
          date_Score, 
          ScoreType 