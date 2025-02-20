Import-Module ActiveDirectory

$inactiveOU = "OU=INAKTIIVSED KASUTAJAD,DC=Viikma,DC=local"
$Aasta = (Get-Date).AddYears(-1)

Get-ADUser -Filter * -Properties LastLogonDate, Enabled | Where-Object {
    $_.Enabled -and ($null -eq $_.LastLogonDate -or $_.LastLogonDate -lt $Aasta)
} | ForEach-Object {
    Move-ADObject -Identity $_.DistinguishedName -TargetPath $inactiveOU
    Disable-ADAccount -Identity $_.SamAccountName
    Write-Output "Kasutaja $($_.SamAccountName) liigutatud ja keelatud"
}