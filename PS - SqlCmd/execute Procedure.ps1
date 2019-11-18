
$database = "DeIdentifiedRegistriesAnalyticsGateway"
$dbcmd = @"
    USE DeIdentifiedRegistriesAnalyticsGateway
    GO

    ;WITH Procedures_CTE AS
	    (
	    select * 
	    from IdentifiedRegistriesAnalyticsGateway.information_schema.routines 
	    where routine_type = 'PROCEDURE' 
	    and Left(Routine_Name, 3) NOT IN ('sp_', 'xp_', 'ms_')
	    )
    select  
	    'EXEC ' + cte.ROUTINE_SCHEMA + '.' + ROUTINE_NAME + ' ' + name + '=1' AS ExecProcedure,
       'Parameter_name' = name,  
       'Type'   = type_name(user_type_id),  
       'Length'   = max_length,  
       'Prec'   = case when type_name(system_type_id) = 'uniqueidentifier' 
                  then precision  
                  else OdbcPrec(system_type_id, max_length, precision) end,  
       'Scale'   = OdbcScale(system_type_id, scale),  
       'Param_order'  = parameter_id,  
       'Collation'   = convert(sysname, 
                       case when system_type_id in (35, 99, 167, 175, 231, 239)  
                       then ServerProperty('collation') end)  
    from sys.parameters p
    INNER JOIN Procedures_CTE cte ON p.object_id = object_id(cte.ROUTINE_SCHEMA + '.' + ROUTINE_NAME)
    WHERE cte.ROUTINE_SCHEMA = 'Fact'
    ORDER BY 1
"@
Clear-Host
$queryResult = Invoke-Sqlcmd -Query $dbcmd -ServerInstance LOCALHOST -Database $database -SuppressProviderContextWarning -MaxCharLength 15000
Write-Host "Start--------->"
foreach($row in $queryResult)
{
    try{
        Invoke-Sqlcmd -Query $row.ExecProcedure -ServerInstance LOCALHOST -Database $database -SuppressProviderContextWarning -MaxCharLength 15000
        #Write-Host "Executed " + $row.ExecProcedure
    }catch{
        Write-Host "Error executing Invoke-Sqlcmd " + $row.ExecProcedure + $Error
    }

#    $row.ProcedureBody | out-file ($outputfoldername + $row.ProcedureName)
    #Write-Output $row.ProcedureBody.Length
}

