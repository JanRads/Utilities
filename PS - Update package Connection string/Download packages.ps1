
$SSISSourceServer = "ANALYTICSDEV2\INST03"        #Packages will be downloaded from this server.
$SSISPackagesRootFolder = "C:\Temp\Upgrade"       #Packages downloaded will reside in this location in a "Download" subfolder.


if(-not($SSISSourceServer)) { 
    Write-Output "Usage - scriptname.ps1 <DBServer\Instance> <FolderPath>"## -foreground Magenta
    Throw "Parameters were not supplied” 
}

$symbols = [PSCustomObject] @{
    TAB = ([char]9)
    SMILEY_WHITE = ([char]9786)
    SMILEY_BLACK = ([char]9787)
    GEAR = ([char]9788)
    HEART = ([char]9829)
    DIAMOND = ([char]9830)
    CLUB = ([char]9827)
    SPADE = ([char]9824)
    CIRCLE = ([char]8226)
    NOTE1 = ([char]9834)
    NOTE2 = ([char]9835)
    MALE = ([char]9794)
    FEMALE = ([char]9792)
    YEN = ([char]165)
    COPYRIGHT = ([char]169)
    PI = ([char]960)
    TRADEMARK = ([char]8482)
    CHECKMARK = ([char]8730)
};

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
    $PackageMSDBSource = $folderPath + "\" + $pkgName;
    $fulldownloadfolderPath = "$SSISPackagesRootFolder\$folderPath";##"$SSISFolder\$folderPath\"
    
    if(!(test-path -path $fulldownloadfolderPath))
    {
        mkdir $fulldownloadfolderPath | Out-Null
    }
    $inFileName = "$fulldownloadfolderPath\$pkgName.dtsx"
    Write-Output "";
    Write-Output "Package ($totalPackageCount) - $inFileName";

    #Download package to msdb
    #"The operation completed successfully." implies success
    $PackageFileName = $pkg.FullName;
    $CommandDownload = "dtutil /SourceS $SSISSourceServer /SQL ""$PackageMSDBSource"" /COPY ""FILE;$inFileName"""
	$Expression = Invoke-Expression -command $CommandDownload
	if ($Expression -match 'The operation completed successfully.' -and (Test-Path -path $inFileName)) 
    {
        Write-Host $symbols.TAB $symbols.CHECKMARK "DOWNLOAD DONE! Package download completed!" -ForegroundColor Green;
    }
    else
    {
        Write-Error $symbols.TAB "`$CommandDownload generated an error" -ErrorAction Continue;#Stop;#Continue;
        Write-Host $symbols.TAB "$Expression" -BackgroundColor Red;
        Write-Host $symbols.TAB "DOWNLOAD ERROR! ($inFileName)" -ForegroundColor Red;
    }

    #for some reason packagedata xml gets prefixed with 3 ???. Strip these out and save as valid xml
    <#
    $firstindex = $pkg.pkg.IndexOf("<");
    $lastindex = $pkg.pkg.LastIndexOf(">") - $firstindex + 1;
    $packagedata = $pkg.pkg.Substring($firstindex, $lastindex);
    $packagedata | Out-File -Force -encoding "ascii" -FilePath "$inFileName"
    #>
}
Write-Output "$totalPackageCount Total packages downloaded."

###/*reference - http://sqlblog.com/blogs/jamie_thomson/archive/2011/02/02/export-all-ssis-packages-from-msdb-using-powershell.aspx*/
