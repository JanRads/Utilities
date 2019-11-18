Set NoCount On

USE dbmsemanticanalyticsstg 

EXEC dbo.Openhhr 

Select Id_Patient, IndicatorId, FromDate, To_Date
from (

--Fall--

SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 143 AND 148 
       AND id_patient IN (SELECT patientkey 
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_Fall%' 
                         ) 
Union
--CAD--


SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 162 AND 178 
       AND id_patient IN (SELECT patientkey 
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_CAD%' 
                         ) 
Union
--HF--



Select *
from dbmSemanticAnalytics.Fact.ActiveIndicator
where IndicatorId in (
Select IndicatorId
from dbmSemanticAnalytics.Dim.ActiveIndicators
where TypeId in (36,37,38)
) AND id_patient IN (SELECT patientkey 
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_HF%' 
                         ) 

Union
--Dep12--


SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 221 AND 230
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_Depr12%' 
                         ) 
Union
--Breast Cancer--


SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 134 AND 142
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_BC%' 
                         ) 

Union
--ColC--


SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 99 AND 109
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_Col%' 
                         ) 
Union
--BMI--


SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 151 AND 161
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_BMI%' 
                         ) 
Union
--Tabacco--

SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 87 AND 98
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_Tab%' 
                         ) 

Union
--High BP--


SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 182 AND 195
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%MSSP_Hi%' 
                         ) 

Union
--HbA1c--
SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 60 AND 64
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%Acthba1c%' 
                         ) 

Union
--Pnemovax--
SELECT * 
FROM   dbmsemanticanalytics.fact.activeindicator 
WHERE  indicatorid BETWEEN 39 AND 44
       AND id_patient IN (SELECT patientkey
                          FROM   dbmsemanticanalyticsstg.persist.mappingpatient 
                          WHERE  dbo.Decrypthr(enc_extension) LIKE '%ActPnemo%' 
                         ) 

)T
Set NoCount Off