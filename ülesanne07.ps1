# Reio, Kursus: IT-24


# Leiab ja kuvab arvutinime
$ComputerName = (Get-WmiObject -Class Win32_ComputerSystem).Name
Write-Output "Arvuti nimi: $ComputerName"

# Leiab arvutis olevad loogilised kettad ja väljastab nende koguarvu
$LogicalDisks = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3"
$DiskCount = $LogicalDisks.Count
Write-Output "Arvutis on $DiskCount loogilist ketast."

# Leiab ja kuvab kõigi ketaste vaba ruumi protsendiliselt
foreach ($disk in $LogicalDisks) {
    $FreeSpace = $disk.FreeSpace
    $Size = $disk.Size
    $FreeSpacePercentage = [math]::round(($FreeSpace / $Size) * 100, 2)
    Write-Output "Ketas $($disk.DeviceID): $FreeSpacePercentage% vaba ruumi"
    if ($FreeSpacePercentage -lt 50) {
        Write-Output "Hakkab täis saama"
    }
}