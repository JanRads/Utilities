USE [dbmSemanticAnalytics]
GO
EXEC [dbmSemanticAnalyticsSTG].[dbo].[OpenHHR]

SELECT B.AgeGroupDesc, 
     ISNULL(CAST( Result as varchar(10)),'') Result
FROM  

( SELECT cast(AgeGroupDesc as varchar(20)) AS  AgeGroupDesc
          FROM   dim.AGEGROUPS 
           WHERE  hierarchyid = 1
) B
LEFT JOIN 

(
SELECT cast(AgeGroupDesc as varchar(20)) AS  AgeGroupDesc, 
       Count(*) Result
FROM   (select *
		from (SELECT * 
        FROM   fact.Readmissions 
        where date_DischargeIndexAdmission != -1
		and   measure_ReadmissionInd is not null
		)T1 WHERE  Dateadd(year, 1, 
dbmsemanticanalyticsstg.dbo.Unconvert_date(date_DischargeReadmission)) 
               >= 
                       Dateadd(month, Datediff(month, -1, Getdate()) - 1, -1) 
               AND EXISTS (SELECT * 
                           FROM   factless.PATIENTRELATIONSFROMTO T2 
                           WHERE  T2.id_patient = T1.id_patient 
                                  AND org_relatedprovider != -1 
                                  AND 
       dbmsemanticanalyticsstg.dbo.Unconvert_date(date__from_relationship) 
       <= 
       Dateadd( 
       month, Datediff(month, -1, Getdate()) - 1, -1) 
                  AND 
       dbmsemanticanalyticsstg.dbo.Unconvert_date(date_to_relationship) >= 
       Dateadd( 
       month, Datediff(month, -1, Getdate()) - 1, -1)))T1 
       INNER JOIN  (select PatientKey, datediff(dd,[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR]([BirthDate]),Dateadd(month, Datediff(month, -1, Getdate()) - 1, -1) ) ageDays 
	   from [Dim].[Patients]) T2
		on T1.id_Patient = T2.PatientKey
		left join Factless.AgeInGroup T3 on T2.ageDays=T3.AgeFK
       INNER JOIN (SELECT * 
                   FROM   dim.AGEGROUPS 
                   WHERE  hierarchyid = 1)T4 
               ON T3.groupfk = T4.agegroupkey 
GROUP  BY AgeGroupDesc
 ) A
ON A.AgeGroupDesc=B.AgeGroupDesc
ORDER BY  B.AgeGroupDesc
