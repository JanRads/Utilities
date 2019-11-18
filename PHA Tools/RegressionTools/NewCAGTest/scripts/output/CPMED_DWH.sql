EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
SELECT CASE 
         WHEN T1.[bookmark] IS NULL THEN 0 
         ELSE 1 
       END                                                       Bookmark, 
       CASE 
         WHEN T1.[timestamp] IS NULL THEN 0 
         ELSE 1 
       END                                                       TimeStamp, 
       T2.encounter_ext, 
       T2.encounter_root, 
       t2.Patient_Root,
       dbmSemanticAnalyticsSTG.dbo.DecryptHR(MP.Enc_Extension) Patient_Ext,
       t5.id_extension 
       AssignedOrgId_Extension, 
       T5.id_root 
       AssignedOrgId_Root, 
       t6.id_extension 
       ReferringOrgId_Extension, 
       T6.id_root 
       ReferringOrgId_Root, 
       LEFT(date_visit, 4)                                   Adm_Year, 
       cast(Substring(Cast(date_visit AS NVARCHAR(10)), 5, 2)as int)     Adm_Month, 
       DAY(dbmSemanticAnalyticsSTG.dbo.DecryptHR(AdmissionDateEnc))                                 Adm_Day, 
       DATEPART(hh,(dbmSemanticAnalyticsSTG.dbo.DecryptHR(AdmissionDateEnc))) Adm_Hour,
	DATEPART(minute,(dbmSemanticAnalyticsSTG.dbo.DecryptHR(AdmissionDateEnc))) Adm_Minute
FROM   [dbmSemanticAnalytics].[CPM].EDVisits T1 
       INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[factencounters] T2 
               ON T1.id_EDVisit = T2.id_encounter 
                  AND encounter_ext LIKE 'CPM_Enc_%' 
       INNER JOIN (SELECT * 
                   FROM   [dbmSemanticAnalyticsSTG].persist.dimorganization) T5 
               ON T1.org_assigned = T5.organizationkeyold 
       INNER JOIN (SELECT * 
                   FROM   [dbmSemanticAnalyticsSTG].persist.dimorganization) T6 
               ON T1.org_assigned = T6.organizationkeyold 
			   INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] MP
ON t2.Patient_Ext=MP.Id_Extension
AND t2.Patient_Root=MP.Id_Root
			   order by encounter_ext