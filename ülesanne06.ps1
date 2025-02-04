# Reio, Kursus: IT-24
# PowerShelli skript emailide töötlemiseks

# Muutuja, mis hoiab ees- ja perenime
$FullName = "Reio Viikmaa"

# Muutuja, mis hoiab emaili
$Email = "reio@hkhk.edu.ee"

# Muutuja, mis hoiab tänast kuupäeva
$TodayDate = Get-Date

# Väljasta kõik muutujad
Write-Output "Täisnimi: $FullName"
Write-Output "Email: $Email"
Write-Output "Tänane kuupäev: $TodayDate"


$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
$emailFilePath = Join-Path -Path $dir -ChildPath "emailid.txt"


$emailContent = Get-Content -Path $emailFilePath


$emailArray = $emailContent -split ','


$myEmail = "reio@hkhk.edu.ee"
$emailArray += $myEmail


$emailCount = $emailArray.Length
Write-Output "Emaili massiivis on $emailCount emaili."

$firstEmail = $emailArray[0]
$lastEmail = $emailArray[-1]
Write-Output "Esimene email massiivis: $firstEmail"
Write-Output "Viimane email massiivis: $lastEmail"