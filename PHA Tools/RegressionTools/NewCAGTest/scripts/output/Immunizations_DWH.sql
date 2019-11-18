Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

SELECT 
 
 PFI.ImmunizationId_Root AS ImmunizationId_Root,
  PFI.ImmunizationId_Extension AS ImmunizationId_Extension,
 PFI.[PatientId_Root] AS PatientId_Root,
  dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension)AS PatientId_Extension, 
 PFI.[EncounterId_Root] AS EncounterId_Root,
  PFI.[EncounterId_Extension] AS EncounterId_Extension,
 PFI.ImmunizationCode as ImmunizationCode,
  PFI.ImmunizationCodeSystem as ImmunizationCodeSystem,
 PFI.AuthorCodeProvider_Root as CareProviderId_Root,
  PFI.AuthorCodeProvider_Extension as  CareProviderId_Extension
 --,PFI.StartDate as StartDate ,
 --PFI.EndDate as EndDate
FROM [dbmSemanticAnalytics].[Fact].[Immunizations] FI
	
	LEFT JOIN
		[dbmSemanticAnalyticsSTG].[Persist].[FactImmunizations] PFI
		ON FI.[id_Immunization] = PFI.[Id_Immunization]
	left  JOIN
	     [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
		on mp.id_Extension = PFI.PatientId_Extension and mp.Id_Root= PFI.PatientId_Root
		where FI.Flag_Claims=0
--where  dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) like 'PHA2%'
ORDER BY 2,3,4,5,6,7,8,9,10



