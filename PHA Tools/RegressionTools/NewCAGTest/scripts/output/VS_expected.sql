with dimVS as

(
 select '8867#4_LN' as code, 137 as id, 'heartExHRmeasure' as name  
 )

, splited as (
select replace(SUBSTRING(code,1, Charindex('_',code,1)-1),'#','-') as code
	   ,SUBSTRING(code, Charindex('_',code,1)+1,len(code)) as codesys
	   ,id
	   ,name
	   
from dimVS)

select [ID] ValueSetID
      ,count([FK]) cnt
from
(select distinct s.id, links.FK
from splited s
		inner join [Dim].[CodeSystemMap] csm
		on s.codesys = csm.ExcelSystemName
		inner join dim.AdminCodes ac
		on (s.code = ac.Local_Code and csm.codesystem = ac.Local_CodeSystem) 
		--or
		--(s.code = ac.Local_Code and csm.codesystem = ac.Local_CodeSystem)
		inner join factless.ConditionsInHierarchy links
		on links.NodeFK = ac.AdminCodeKey

union 

select distinct s.id, ac.AdminCodeKey
from splited s
		inner join [Dim].[CodeSystemMap] csm
		on s.codesys = csm.ExcelSystemName
		inner join dim.AdminCodes ac
		on (s.code = ac.Local_Code and csm.codesystem = ac.Local_CodeSystem)
		--or
		--(s.code = ac.baseline_code and csm.codesystem = ac.besline_codeSystem)

		) final

group by id