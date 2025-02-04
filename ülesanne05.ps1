#Reio, Kursus: IT-24

# Puhastab ekraani
Clear-Host



# Masina nimi (Host Name)
Write-Output "Masina nimi (Host Name):"
$HostName = (Get-WmiObject -Class Win32_ComputerSystem).Name
Write-Output $HostName
Write-Output "*******************"

# Operatsioonisüsteem (OS name)
Write-Output "Operatsioonisüsteem (OS name):"
$OSName = (Get-WmiObject -Class Win32_OperatingSystem).Caption
Write-Output $OSName
Write-Output "*******************"

# IP aadress (netipaddress, netadapter)
Write-Output "IP aadress (IP Address):"
$IPAddress = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -ne $null }).IPAddress
Write-Output $IPAddress
Write-Output "*******************"

# Muutmälu suurus (RAM)
Write-Output "Muutmälu suurus (RAM):"
$RAM = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory
$RAMGB = [math]::round($RAM / 1GB, 2)
Write-Output "$RAMGB GB"
Write-Output "*******************"

# Protsessori nimi (Processor, CPU)
Write-Output "Protsessori nimi (Processor, CPU):"
$CPUName = (Get-WmiObject -Class Win32_Processor).Name
Write-Output $CPUName
Write-Output "*******************"

# Graafikakaardi nimi (VideoController)
Write-Output "Graafikakaardi nimi (VideoController):"
$VideoController = (Get-WmiObject -Class Win32_VideoController).Name
Write-Output $VideoController
Write-Output "*******************"

# Arvuti kasutajate nimed (UserAccount)
Write-Output "Arvuti kasutajate nimed (UserAccount):"
$UserAccounts = Get-WmiObject -Class Win32_UserAccount | Select-Object -ExpandProperty Name
foreach ($user in $UserAccounts) {
    Write-Output $user
}
Write-Output "*******************"