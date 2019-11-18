
$rootDir = "C:\+\git\isr\PHA_18.2_Version\Databases\PHA_RAGS\AccRegistriesAnalyticsGateway"
$srcDirName = "Schemas","Types","Sequences","Tables","Views","Functions","Procedures","Indexes"
Clear-Host
Foreach ($i in $srcDirName)
{
    Write-Host $i
    $dirPath = $rootDir + "\" + $i +"\"
    Get-ChildItem $dirPath -Filter *.sql |
    Foreach-Object {
        try{
            $filecontent = Get-Content $_.FullName
        }catch{
            Write-Host "Error fetching files in folder " + $dirPath + $Error
        }

        try{
            Invoke-Sqlcmd -InputFile $_.FullName -ServerInstance LOCALHOST -SuppressProviderContextWarning -MaxCharLength 15000
            Write-Host "Executed " + $_.FullName
        }catch{
            Write-Host "Error executing Invoke-Sqlcmd " + $_.FullName + $Error
        }
    }
}
