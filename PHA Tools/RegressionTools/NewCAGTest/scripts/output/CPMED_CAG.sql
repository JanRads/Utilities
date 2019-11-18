SELECT 1                           AS Bookmark, 
       1                           AS TimeStamp, 
       encounterid_extension encounter_ext, 
       encounterid_root encounter_root, 
       patientid_root Patient_Root, 
       patientid_extension Patient_Ext, 
       AssignedOrgId_Extension, 
       AssignedOrgId_Root, 
       ReferringOrgId_Extension, 
       ReferringOrgId_Root, 
       Year(startdate)             Adm_Year, 
       Month(startdate)            Adm_Month, 
       Day(startdate)              Adm_Day, 
       Datepart(hour, startdate)   Adm_Hour, 
       Datepart(minute, startdate) Adm_Minute
FROM   dbmclinicalanalyticsgateway.fact.encounters 
WHERE  encounterclassindicator LIKE 'EMER' 
       AND encounterid_extension LIKE 'CPM_Enc_%' 
	   order by encounter_ext