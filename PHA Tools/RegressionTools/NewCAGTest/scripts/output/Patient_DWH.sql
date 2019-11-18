Set nocount on
 EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

SELECT distinct
     --MP.Id_Root AS PatientId_Root
	--,dbmSemanticAnalyticsSTG.dbo.DecryptHR(MP.Enc_Extension) AS PatientId_Extension
	MP.PPOLID AS EnterprisePatientId
	,P.PatientMPIID AS PatientMPIID
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FullName) AS FullName
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FirstName) AS FirstName
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.LastName) AS LastName
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.MiddleName) AS MiddleName
	,YEAR(dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.BirthDate))*10000+Month(dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.BirthDate))*100+Day(dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.BirthDate)) AS TimeOfBirth
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.DateOfDeath )AS TimeOfDeath
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.AddressLine1) AS AddressLine1
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.AddressLine2) AS AddressLine2
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.MobilePhone) AS MobilePhone
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.HomeEmail) AS HomeEmail
	,P.GenderDesc
	
FROM [dbmSemanticAnalytics].dim.Patients P
inner JOIN [dbmSemanticAnalyticsSTG].Persist.MappingPatient MP ON P.PatientKey = MP.PatientKey


WHERE dbmSemanticAnalyticsSTG.dbo.DecryptHR(MP.Enc_Extension) LIKE N'PHA_EncAT_P%' 
ORDER BY MP.PPOLID
--ORDER BY MP.Id_Root
--	,PatientId_Extension
