use [dbmClinicalAnalyticsGateway]
Go
WITH Enc1 AS (
select  [AllergyId_Root],[Allergyid_Extension],PatientId_Root,PatientId_Extension,
--HashBytes('SHA1', CONVERT(VARBINARY(255), [PatientId_Extension])) as PatientId_Extension,
EncounterId_Root,EncounterId_Extension,AssignedOrgId_Root,AssignedOrgId_Extension,[AllergyCode],[AllergyCodeSystem],
PerformerId_Root,PerformerId_Extension,AllergyValueCode,AllergyValueCodeSystem ,[SourceSystemId_Root],[SourceSystemId_Extension],[UncertaintyCode],[UncertaintyCodeSystem]
 from  
(select [AllergyId_Root],[Allergyid_Extension],PatientId_Root,PatientId_Extension,EncounterId_Root,EncounterId_Extension,AssignedOrgId_Root,AssignedOrgId_Extension,[AllergyCode],[AllergyCodeSystem],PerformerId_Root,PerformerId_Extension,AllergyValueCode,AllergyValueCodeSystem,fact.Allergies.[TimeStamp],[SourceSystemId_Root],[SourceSystemId_Extension],[UncertaintyCode],[UncertaintyCodeSystem],
                 row_number() over (PARTITION by [Allergyid_Extension] order by fact.Allergies.[TimeStamp] desc) as I_rn, [DeleteKey] as I_Del
                from Fact.Allergies

) a
where a.I_rn=1 and a.I_Del<>1
)
select [AllergyId_Root],[Allergyid_Extension],PatientId_Root,PatientId_Extension,
--CAST(N'' AS XML).value('xs:base64Binary(xs:hexBinary(sql:column("PatientId_Extension")))', 'VARCHAR(255)')as PatientId_Extension,
EncounterId_Root,EncounterId_Extension,AssignedOrgId_Root,AssignedOrgId_Extension,[AllergyCode],[AllergyCodeSystem],PerformerId_Root,PerformerId_Extension,AllergyValueCode,AllergyValueCodeSystem 
,[SourceSystemId_Root],[SourceSystemId_Extension],[UncertaintyCode],[UncertaintyCodeSystem]
from Enc1
order by 1,2
