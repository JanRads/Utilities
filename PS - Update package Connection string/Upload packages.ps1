
$SSISDestinationServer = "ANALYTICSDEV2\INST03"   #Packages will be uploaded to this server.
$SSISPackagesRootFolder = "C:\Temp\Upgrade"       #Packages to be uploaded resides in this location in a "Upload" subfolder.

$SSISPackagesRootFolder = $SSISPackagesRootFolder + "\Upload";
$Packages = Get-ChildItem -Recurse $SSISPackagesRootFolder -File
$PackageMSDBDestination = "";
$uploadedPackageCount = 0;
$totalPackageCount = 0;
$greenCheck = [PSCustomObject] @{
  Object = [Char]8730
  ForegroundColor = 'Green'
  NoNewLine = $true
  };
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

Foreach ($pkg in $Packages)
{
    $totalPackageCount = $totalPackageCount + 1;
    $PackageMSDBDestination = $pkg.FullName.Replace($SSISPackagesRootFolder, "").Replace(".dtsx", "");
    
    #Delete package from msdb
    $CommandDelete = "dtutil /SourceS $SSISDestinationServer /SQL $PackageMSDBDestination /DELETE";
	$Expression = Invoke-Expression -command $CommandDelete
	if ($Expression -match 'Error') 
    {
        Write-Output "WARNING! Package to delete does not exist.";
    }

    #Upload package to msdb
    $PackageFileName = $pkg.FullName;
    Write-Output "Package ($totalPackageCount) - $PackageFileName";
    $CommandUpload = "dtutil /DestS $SSISDestinationServer /FILE $PackageFileName /COPY ""SQL;$PackageMSDBDestination"""
	$Expression = Invoke-Expression -command $CommandUpload
	if ($Expression -match 'The operation completed successfully.') 
    {
        $dtutilPkgExists = "dtutil /SourceS $SSISDestinationServer /EXISTS /SQL $PackageMSDBDestination";
	    $Expression = Invoke-Expression -command $dtutilPkgExists
	    if ($Expression -match 'The specified package exists.') 
        {
            $uploadedPackageCount = $uploadedPackageCount + 1;
            Write-Host $symbols.TAB $symbols.CHECKMARK " UPLOAD DONE! Package upload completed!" -ForegroundColor Green;
        }
        else
        {
            Write-Error $symbols.TAB "`$dtutilPkgExists generated an error" -ErrorAction Continue;#Stop;#Continue;
            Write-Host $symbols.TAB "$Expression" -BackgroundColor Red;
            Write-Host $symbols.TAB "UPLOAD ERROR! ($PackageMSDBDestination)" -ForegroundColor Red;
        }
    }
    else
    {
        Write-Error $symbols.TAB "`$CommandUpload generated an error" -ErrorAction Continue;
        Write-Host $symbols.TAB "$Expression" -BackgroundColor Red;
        Write-Host $symbols.TAB "UPLOAD ERROR! ($PackageMSDBDestination)" -ForegroundColor Red;
    }
}
Write-Output "$uploadedPackageCount of $totalPackageCount packages uploaded."
