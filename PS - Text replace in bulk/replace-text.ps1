$findStr = "USE IdentifiedRegistriesAnalyticsGateway"
$replaceWith = "USE AccRegistriesAnalyticsGateway"
$srcDir = "C:\temp\MoH\IRAG\"
$dstDir = "C:\temp\MoH\AccRAG\"
Get-ChildItem $srcDir -Filter *.sql |
Foreach-Object {

    $filecontent = Get-Content $_.FullName
    #replace string
    $matchFound = $filecontent | Select-String -Pattern $findStr
    if($matchFound.length -gt 0){
        Write-Host 'Match in ' $_.Name $matchFound
        $filecontent.replace($findStr, $replaceWith) | Set-Content $dstDir$_
    }else{
        Write-Host 'No Match in ' $_.Name
    }
    #$filecontent.replace($findStr, $replaceWith) | Set-Content $dstDir$_
    #find string
    #Write-Output $_.FullName $filecontent.IndexOf("a")
    #$filecontent | Select-String -Pattern "_src"
    #if($filecontent.IndexOf($findStr) -ne -1){
     #   Write-Output "Found Match at " Get-Content $_.FullName $filecontent.IndexOf($findStr)
    #}
}
