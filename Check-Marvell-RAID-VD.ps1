#Powershell Marvell RAID VD-Check for Solarwinds RMM
#Author: Andreas Walker a.walker@glaronia.ch
#Licence: GNU General Public License v3.0
#Version: 1.0.0 / 16.03.2021

Param (
[Parameter(Mandatory=$true)][int]$vdid
)

$cli = "C:\Program Files (x86)\Marvell\storage\interface\mvsetup.exe"

if (!(Test-Path $cli))
    {
    Write-Host 'ERROR - Missing Marvell CLI! Please Download from https://support.hpe.com/hpsc/swd/public/detail?swItemId=MTX_17d87af242a144cbb3a954352c&swEnvO'
    exit 1001
    }

$vars = & "$cli" "info -o vd".split() | select -skip 3 | select -SkipLast 2

$StartLine = $vdid * 13

$Result = $vars | select -skip $StartLine | select -First 12

$Status = $Result | Where-Object {$_ -match "status:" } | Where-Object {$_ -notmatch "BGA status:" }
$Status = $Status -replace "^status:\s{1,}",""

if ($Status -ne 'functional')
    {
    Write-Host 'ERROR - Virtual Disk' $vdid 'has status' $Status
    $Result
    exit 1001
    }
    else 
        {
        Write-Host 'OK - Virtual Disk' $vdid 'has status'$Status
        $Result
        exit 1
        }


Write-Host 'ERROR - Script came to an unexpected end!'
exit 1001