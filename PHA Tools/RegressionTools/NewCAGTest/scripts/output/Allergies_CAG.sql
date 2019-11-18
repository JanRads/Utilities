---EXP---
use [dbmClinicalAnalyticsGateway]
Go
WITH Enc1 AS (
			select  [AllergyId_Root] , [Allergyid_Extension] ,PatientId_Root,PatientId_Extension,EncounterId_Root ,EncounterId_Extension, [AssignedOrgId_Root],[AssignedOrgId_Extension] ,[AllergyCode],[AllergyCodeSystem],
			PerformerId_Root,PerformerId_Extension,AllergyValueCode,AllergyValueCodeSystem ,[SourceSystemId_Root],[SourceSystemId_Extension],[UncertaintyCode],[UncertaintyCodeSystem]
			 from  
			(select [AllergyId_Root],
			        [Allergyid_Extension],
					PatientId_Root,
					PatientId_Extension,
					EncounterId_Root,
					EncounterId_Extension,
					AssignedOrgId_Root,
					AssignedOrgId_Extension,
					[AllergyCode],
					[AllergyCodeSystem],
					PerformerId_Root,
					PerformerId_Extension,
					AllergyValueCode,
					AllergyValueCodeSystem,
					fact.Allergies.[TimeStamp],
					[SourceSystemId_Root],
					[SourceSystemId_Extension],
					[UncertaintyCode],
					[UncertaintyCodeSystem],
				   row_number() over (PARTITION by [Allergyid_Extension] 
			     	 order by fact.Allergies.[TimeStamp] desc
				   ) as I_rn, [DeleteKey] as I_Del
             from Fact.Allergies
			 WHERE Allergyid_Extension like 'PHA%'
            ) a
where a.I_rn=1 and a.I_Del <> 1
)
select [AllergyId_Root] , [Allergyid_Extension] , PatientId_Root,PatientId_Extension,EncounterId_Root ,EncounterId_Extension,[AssignedOrgId_Root],
[AssignedOrgId_Extension] ,[AllergyCode],[AllergyCodeSystem],PerformerId_Root,PerformerId_Extension,AllergyValueCode,AllergyValueCodeSystem 
,[SourceSystemId_Root],[SourceSystemId_Extension],[UncertaintyCode],[UncertaintyCodeSystem]
from Enc1;