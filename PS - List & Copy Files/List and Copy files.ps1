
 param (
    [string]$MODE = "LIST"
 )

#$MODE = "LIST"    #'LIST'        #COPY
$SRCFOLDER = "\\corp.allscripts.com\dbmotion\P_R&D\Analytics\B7 Team\Claims 837\Claims files from payrpath\Claims_837_sample_files - Yudong He\db" 
$DSTFOLDER = "C:\Temp\ClaimsFiles" 
$OUTFILE = "C:\Temp\AllClaimsFiles0.txt"
$PROCESSFILECOUNT = 20
$STARTDATE = [datetime] '2017-07-01'

cls
$ENDDATE = Get-Date
$DATEDIFF = ($ENDDATE - $STARTDATE).Days
$STARTLINE = $DATEDIFF * $PROCESSFILECOUNT
$ENDLINE = $STARTLINE + $PROCESSFILECOUNT
$FILECOUNTER = 0
Write-Output $DATEDIFF $STARTLINE $ENDLINE

if($MODE -eq "LIST"){
    Write-Output "Preparing file list"
    Get-ChildItem $SRCFOLDER -Recurse -File -Filter *.* |
    Foreach-Object {
     Write-Output $_.fullname
     $FILECOUNTER += 1
    } #> $OUTFILE
    Write-Output "List file complete " $FILECOUNTER
}

if($MODE -eq "COPY"){
    (Get-Content $OUTFILE) |
    ForEach-Object {
        if(Test-Path $_){
            Copy-Item $_ -Destination $DSTFOLDER
            Write-Output Copying file $FILECOUNTER $_ to $DSTFOLDER
            $FILECOUNTER += 1
        }
        if($FILECOUNTER -gt $PROCESSFILECOUNT){
            Exit
        }
    }
}

$ENDDATE2 = Get-Date
Write-Output ($ENDDATE2-$ENDDATE).TotalMilliSeconds
