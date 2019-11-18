<#
    .SYNOPSIS
    A utility to help optimize the Content Receiver generated queries

    .DESCRIPTION
    This script reads an input file that is a ContentReceiver generated query with several UNION ALL statements
    It then outputs a 'formatted' .sql file that just adds line breaks
    as well as a 'stripped down' .txt file that is only the Join and where clauses from those sub-queries
#>

param(
    [string] [Parameter(Mandatory=$true)] $FileName
)

If(-Not(Test-Path $FileName)) {
    Write-Host "Could not find $FileName"
}

$Raw = Get-Content $FileName

$Formatted = $Raw  -replace "SELECT","`r`nSELECT" -replace "FROM","`r`nFROM" -replace "JOIN","`r`nJOIN" -replace "UNION","`r`nUNION" -replace "WHERE","`r`nWHERE"

$CleanFileName = $FileName + "Formatted.sql"
Set-Content -Path $CleanFileName -Value $Formatted

$Clean = Get-Content $CleanFileName

$StrippedDownFileName = $FileName + "StrippedDown.txt"
$Clean | Where-Object { $_ -match "JOIN" -or $_ -match "WHERE" } | Set-Content $StrippedDownFileName