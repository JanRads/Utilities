<#
This script reads the queries and optimizes it by combining the separate UNION ALL into a single IN clause.
The script assumes the queries from the same table will only differ in the ValueSetID clause. This clause will be replaced before comparing the separate queries for equality.
For same table queries the ValueSetID will be appended to a key-value hashtable. [Key=Query, Value=ValueSetIDs].

The queries to be optimized have been imported to the working table dbo.DEA_ProgramVersion.
This script will update the column OptimizedQuery in the table, which can be exported to customer env after verification.

Review the results to ensure it passes validation before setting debug to FALSE and commiting the changes.
#>

#BEGIN Variable declaration ##############################
#Database Instance to connect to
$ServerInstance = "PRTDEV-DATA02\INST01"
$Database = "dbmSemanticAnalyticsSTG"

#Keywords to search / replace
$PrefixText = "EXEC dbo.OpenHHR"
$UNIONText = "UNION ALL"
$WHEREFieldName = "ValueSetID"
$RegExpValueSetFilter = "\[?" + $WHEREFieldName + "\]?\s?=\s?(\d{1,5})"   #regex to find "[ValueSetID] = 123" and replace with 1=1 to prevent interfering base query match. Also match the ValueSetID to be used later

$SelectQuery = "SELECT *
            FROM dbo.DEA_FindCandidateQueries F
            INNER JOIN dbo.DEA_ProgramVersion V
	            ON F.ProgramVersion = V.RecentVersion
            WHERE Name = 'MSSP 2017 MP'
            --AND KMGUID = '82F1553D-66CE-40AF-9197-5165593A729B'
            ORDER BY ProgramID, KMGUID, Duplicate"
$UpdateQueryTemplate = "UPDATE F
                SET OptimizedQuery = '{0}'
                FROM dbo.DEA_FindCandidateQueries F
                INNER JOIN dbo.DEA_ProgramVersion V
	                ON F.ProgramVersion = V.RecentVersion
                WHERE Name = 'MSSP 2017 MP'
                AND KMGUID = '{1}'
                AND KMVersion = '{2}'
                "
$DEBUGMODE = "TRUE" #set to false to update query
#END Variable declaration ##############################

#Retrieve the queries to be optimized. Returns all queries for all knowledge modules for MSSP
$Results = Invoke-Sqlcmd -Query "$SelectQuery" -ServerInstance "$ServerInstance" -Database "$Database" -MaxCharLength 50000 #override sqlcmd default maxlength of 4K

#Iterate each query for a knowledge module (including unions)
foreach ($Row in $Results)
{
    Write-Output "Parsing query $($Row.KMGUID), $($Row.KMVersion)"
    #$Row.Query + "`r`n"+ "`r`n" | Out-File -Append -FilePath C:\Temp\DEA_OptimizeQuery.sql
    $UnifiedQuery = ""
    $HTDistinctQueries = @{}
    $SelectQueryNoHHR = $Row.Query -replace $PrefixText, ""
    $ArrDistinctQuery = $SelectQueryNoHHR -split $UNIONText #split on substring of union to return separate queries
    foreach($OneSelectQuery in $ArrDistinctQuery)
    {
        $OneSelectQueryToMatch = $OneSelectQuery -replace $RegExpValueSetFilter, '1=1'      #replace the only difference between the queries to be unified with 1=1.
        $m = $OneSelectQuery -match $RegExpValueSetFilter
        if($HTDistinctQueries.ContainsKey($OneSelectQueryToMatch))   
        {
            #if the query exists as key append the ValueSetID to the value
            $HTDistinctQueries[$OneSelectQueryToMatch] = $HTDistinctQueries[$OneSelectQueryToMatch] + ',' + $Matches[1]
           
        }
        else
        {
            #if the query does not exist add new key-value with Query and ValueSetID
            $HTDistinctQueries.add($OneSelectQueryToMatch, $Matches[1])
        }
    }
    #$HTDistinctQueries.GetEnumerator() | export-csv C:\Temp\DEA_OptimizeQuery.txt
    $UnifiedQuery = $PrefixText + "`r`n" + (($HTDistinctQueries.GetEnumerator() | % { $_.Key.replace("1=1", "[" + $WHEREFieldName + "]" + " IN (" + $_.Value + ")") }) -join "`r`n$UNIONText`r`n") 
    $UpdateQuery = [string]::Format($UpdateQueryTemplate, $UnifiedQuery, $Row.KMGUID, $Row.KMVersion)

    #Code below is for validating the before and after queries ###################################################################################
    #Validate the generated query against input query by matching count of ValueSetIDs in both
    $CountInput = ([regex]::Matches($Row.Query, $RegExpValueSetFilter)).count

    $RegExpValueSetINFilter = "\[?" + $WHEREFieldName + "\]?\s?IN\s?\(\s?(\d{1,5},?)+\s?\)"   #regex to find "[ValueSetID] IN (123)" and replace with 1=1 to prevent interfering base query match. Also match the ValueSetID to be used later
    $m = $UnifiedQuery -match $RegExpValueSetINFilter
    $OutputPatterns = ([regex]::Matches($UnifiedQuery, $RegExpValueSetINFilter))  #extract all ValueSetID IN clause from the final query
    $CountOutput = 0
    foreach($item in $OutputPatterns)
    {
        $CountOutput += ([regex]::Matches($item, "\d+")).Count                    #Count each occurence of ValueSetID, this should be same as input count 
    }

    #Update target work table with the unified query ############################################################################################
    if($CountInput -ne $CountOutput)
    {
        Write-Host "Error! $($Row.KMGUID), $($Row.KMVersion) - Error encountered optimizing query" -ForegroundColor red
    }
    else
    {
        Write-Host "Done Validation! $($Row.KMGUID), $($Row.KMVersion). ValueSetID count Input[$($CountInput)] Optimized[$($CountOutput)]" -ForegroundColor green
        #if debug is FALSE apply changes to table, commit this to database
        if($DEBUGMODE -eq "FALSE")
        {
            $Results = Invoke-Sqlcmd -Query "$UpdateQuery" -ServerInstance "$ServerInstance" -Database "$Database"
            Write-Host "Done Update! $($Row.KMGUID), $($Row.KMVersion) - Optimized Query update applied. ValueSetID count Input[$($CountInput)] Optimized[$($CountOutput)]" -ForegroundColor green
        }
    }
    #Log
    "`r`n--NewKMQuery[KMGUID:$($Row.KMGUID)][KMVersion:$($Row.KMVersion)][InputCount:$($CountInput)][OutputCount:$($CountOutput)]`r`n" + $UnifiedQuery | Out-File -Append -FilePath C:\Temp\DEA_OptimizeQuery.sql    #also write output to file
}

