$outputfoldername = "C:\+\git\ral\All_SQL\MoH\DataNavigator\Procedures\"
$outputfilename
$dbcmd = @"
        SELECT ProcedureName, ProcedureBody
        FROM dbmClinicalAnalyticsGateway.TEMP.OutputProcedures
        --WHERE ProcedureName = 'Fact.AllergiesPop_prc.StoredProcedure.sql'
"@
Clear-Host
$queryResult = Invoke-Sqlcmd -Query $dbcmd -ServerInstance DBM8-DATA114\INST01 -SuppressProviderContextWarning -MaxCharLength 15000
foreach($row in $queryResult)
{
    $row.ProcedureBody | out-file ($outputfoldername + $row.ProcedureName)
    #Write-Output $row.ProcedureBody.Length
}
