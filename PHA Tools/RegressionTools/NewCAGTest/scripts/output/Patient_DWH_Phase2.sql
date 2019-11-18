

select MP.Id_Root as PatientId_Root, MP.Id_Extension as PatientId_Extension, MP.PPOLID as EnterprisePatientId, P.PatientMPIID as PatientMPIID,
P.FullName as FullName, P.FirstName as FirstName, P.LastName as LastName, P.MiddleName as MiddleName,
P.TimeOfBirth as TimeOfBirth, P.TimeOfDeath as TimeOfDeath, 
P.AddressLine1 as AddressLine1, P.AddressLine2 as AddressLine2, P.MobilePhone as MobilePhone, P.HomeEmail as HomeEmail,
G.Local_Code as GenderCode, G.Local_CodeSystem as GenderCodeSystem
from [dbmSemanticAnalytics].dim.Patients P
left join [dbmSemanticAnalyticsSTG].Persist.MappingPatient MP
on P.PatientKey = MP.PatientKey
left join (select * FROM [dbmSemanticAnalytics].[Dim].[AdminCodes]  where DimName like 'AdministrativeGender') G
on P.GenderID = G.AdminCodeKey 
where MP.Id_Extension LIKE N'PHA_EncAT_P%'  
OR mp.Id_Extension LIKE N'PHA_DIM_P%'  
OR P.FullName LIKE 'PHA_CHUNK_TEST%'
order by MP.Id_Root, MP.Id_Extension