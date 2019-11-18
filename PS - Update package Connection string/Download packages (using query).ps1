
$SSISSourceServer = "ANALYTICSDEV2\INST03"        #Packages will be downloaded from this server.
$SSISPackagesRootFolder = "C:\Temp\Upgrade"       #Packages to be updated downloaded to this location.


if(-not($SSISSourceServer)) { 
    Write-Output "Usage - scriptname.ps1 <DBServer\Instance> <FolderPath>"## -foreground Magenta
    Throw "Parameters were not supplied” 
}

$Packages =  Invoke-Sqlcmd -MaxCharLength 10000000 -ServerInstance $SSISSourceServer -Query "WITH cte AS (
                                                                        SELECT    TOP 5 cast(foldername as varchar(max)) as folderpath, folderid
                                                                        FROM    msdb..sysssispackagefolders
                                                                        WHERE    parentfolderid = '00000000-0000-0000-0000-000000000000'
                                                                        UNION    ALL
                                                                        SELECT    cast(c.folderpath + '\' + f.foldername  as varchar(max)), f.folderid
                                                                        FROM    msdb..sysssispackagefolders f
                                                                        INNER    JOIN cte c        ON    c.folderid = f.parentfolderid
                                                                    )
                                                                    SELECT    c.folderpath
                                                                        , p.name
                                                                        --, CAST(CAST(packagedata AS VARBINARY(MAX)) AS XML) as pkg
                                                                        , CAST(CAST(packagedata AS VARBINARY(MAX)) AS VARCHAR(MAX)) as pkg
                                                                    FROM    cte c
                                                                    INNER    JOIN msdb..sysssispackages p    ON    c.folderid = p.folderid
                                                                    WHERE    c.folderpath NOT LIKE 'Data Collector%'"

$SSISPackagesRootFolder = $SSISPackagesRootFolder + "\Download";
$totalPackageCount = 0;
$uploadedPackageCount = 0;
Foreach ($pkg in $Packages)
{
    $totalPackageCount += 1;
    $pkgName = $Pkg.name
    $folderPath = $Pkg.folderpath
    $fulldownloadfolderPath = "$SSISPackagesRootFolder\$folderPath";##"$SSISFolder\$folderPath\"
    
    if(!(test-path -path $fulldownloadfolderPath))
    {
        mkdir $fulldownloadfolderPath | Out-Null
    }
    $inFileName = "$fulldownloadfolderPath\$pkgName.dtsx"
    Write-Output "";
    Write-Output "File ($totalPackageCount) - $inFileName";
    #for some reason packagedata xml gets prefixed with 3 ???. Strip these out and save as valid xml
    $firstindex = $pkg.pkg.IndexOf("<");
    $lastindex = $pkg.pkg.LastIndexOf(">") - $firstindex + 1;
    $packagedata = $pkg.pkg.Substring($firstindex, $lastindex);
    $packagedata | Out-File -Force -encoding "ascii" -FilePath "$inFileName"
    Write-Output "DOWNLOAD DONE! Download completed.";
}
Write-Output "$totalPackageCount Total packages downloaded."

###/*reference - http://sqlblog.com/blogs/jamie_thomson/archive/2011/02/02/export-all-ssis-packages-from-msdb-using-powershell.aspx*/
