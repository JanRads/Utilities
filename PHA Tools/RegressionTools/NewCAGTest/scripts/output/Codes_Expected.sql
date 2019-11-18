use dbmClinicalAnalyticsGateway

select LocalCode [Local_Code],LocalCodeSystem [Local_CodeSystem]
--rtrim(ltrim(LocalCode)) [Local_Code], rtrim(ltrim(LocalCodeSystem)) [Local_CodeSystem]

from
(select 
 LocalCode, LocalCodeSystem , DeleteKey , LastUpdate, max(LastUpdate) over (partition by LocalCode, LocalCodeSystem ) dat

from
(SELECT isnull(LocalCode.CodeId,0) CodeId, LocalCode.ConceptCode AS LocalCode
	,LocalCode.ConceptCodeSystem AS LocalCodeSystem
	,LocalCode.Designation AS LocalDesc
	,CASE 
	WHEN LocalCode.IsLocal = 0
	THEN LocalCode.ConceptCode
	ELSE BaseLineCode.ConceptCode 
	END AS BaseLineCode
	,CASE 
	WHEN LocalCode.IsLocal = 0
	THEN LocalCode.ConceptCodeSystem
	ELSE BaseLineCode.ConceptCodeSystem 
	END AS BaseLineCodeSystem
	,CASE 
	WHEN LocalCode.IsLocal = 0
	THEN LocalCode.Designation
	ELSE BaseLineCode.Designation 
	END AS BaseLineDesc
	,CASE 
		WHEN LocalCode.[TimeStamp] < BaseLineCode.[TimeStamp] and 
		links.TimeStamp < BaselineCode.TimeStamp
			THEN BaseLineCode.[TimeStamp]
		WHEN LocalCode.TimeStamp < links.TimeStamp
			THEN links.TimeStamp
		ELSE LocalCode.[TimeStamp]
		END AS LastUpdate
	,CASE 
		WHEN LocalCode.LastUpdated < BaseLineCode.LastUpdated 
		and links.LastUpdated < BaselineCode.LastUpdated
			THEN BaseLineCode.LastUpdated
		WHEN LocalCode.LastUpdated < links.LastUpdated
			THEN links.LastUpdated
		ELSE LocalCode.LastUpdated
		END AS dbmAvailabilityTime
	,LocalCode.UMSDomain
	,links.DeleteKey
	,LocalCode.CodeSystemName AS CodeSystemName
	,CASE 
	WHEN LocalCode.IsLocal = 0
	THEN LocalCode.CodeSystemName
	ELSE BaseLineCode.CodeSystemName 
	END AS BaseLineCodeSystemName


	FROM MasterData.Codes_v LocalCode
	
	
LEFT JOIN 
	MasterData.CodesLinks_v links
	ON LocalCode.CodeId = links.SourceCodeId
	AND (RelationType = 'EQUALS_TO' OR RelationType = 'BROADER_THAN' )
	
	
LEFT JOIN 
	MasterData.Codes_v BaselineCode	
	ON links.TargetCodeId = BaselineCode.CodeId
		AND BaselineCode.IsLocal = 0  
		AND LocalCode.UMSDomain=BaselineCode.UMSDomain  
		
) cag
left join
[dbmSemanticAnalyticsSTG].[STG].[UMSDomain] su
on cag.UMSDomain = su.UMSDomain 
where 

 LocalCode not in ('-1')
and su.DimName is not null
and localcode is not null
and LocalCodeSystem is not null
and len(LocalCode) <> 0

) rr 
where (rr.DeleteKey = 0 or rr.DeleteKey is null)
and LastUpdate = dat



union 

select distinct [Code],[CodeSystem]
from 
[dbmSemanticAnalyticsSTG].[Mirror].[ExternalCodes]

order by 1,2
