
select 

distinct Local_Code,Local_CodeSystem
--rtrim(ltrim([Local_Code])) [Local_Code], rtrim(ltrim([Local_CodeSystem])) [Local_CodeSystem]
FROM [dbmSemanticAnalytics].[Dim].[AdminCodes] a
--on a.dimname = su.[DimName]
where DimName not in ('-1','NULL')
and DimName not like '%-1%'
and dimname is not null
and Local_Code is not null
and local_code not in ('-1')
and len(Local_Code) <> 0-- not in ()
and a.AdminCodeDesc not like 'Unmapped%'
order by 1,2
