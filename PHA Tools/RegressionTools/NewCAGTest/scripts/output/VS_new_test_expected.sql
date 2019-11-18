with dimVS as

(
 select '195967001_SNM' as code, null as id, 'Asthma' as name  
 union select '4548#4_LN' as code, null as id, 'A1C Labs' as name 
 union select '4549#2_LN' as code, null as id, 'A1C Labs' as name 
 union select '17856#6_LN' as code, null as id, 'A1C Labs' as name 
 )

, splited as (
select replace(SUBSTRING(code,1, Charindex('_',code,1)-1),'#','-') as code
	   ,SUBSTRING(code, Charindex('_',code,1)+1,len(code)) as codesys
	   --,id
	   ,name
	   
from dimVS)

select  name
      ,count([FK]) cnt
from
(select distinct s.name, links.FK
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

select distinct  s.name, ac.AdminCodeKey
from splited s
		inner join [Dim].[CodeSystemMap] csm
		on s.codesys = csm.ExcelSystemName
		inner join dim.AdminCodes ac
		on (s.code = ac.Local_Code and csm.codesystem = ac.Local_CodeSystem)
		or
		(s.code = ac.baseline_code and csm.codesystem = ac.besline_codeSystem)

		) final

group by  name