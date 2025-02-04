# Laadime csv faili
$users = Import-Csv -Path "users.csv"

# Funktsioon parooli genereerimiseks
function Genereeri-Parool {
    param (
        [string]$Perenimi
    )
    $random = Get-Random -Minimum 10 -Maximum 99
    $parool = ($Perenimi.Substring(0,3).ToLower() + $random)
    return $parool
}

# Loome uue tulemuste listi
$results = @()

foreach ($user in $users) {
    # Loome uued veerud
    $nimi = "$($user.first_name) $($user.last_name)"
    $kasutajanimi = "$($user.first_name.Substring(0,1).ToLower())$($user.last_name.ToLower())"
    $email = "$($user.first_name.ToLower()).$($user.last_name.ToLower())@hkhk.edu.ee"
    $parool = Genereeri-Parool -Perenimi $user.last_name

    # Loome uue objekti ja lisame tulemuste listi
    $result = [PSCustomObject]@{
        id = $user.id
        first_name = $user.first_name
        last_name = $user.last_name
        email = $user.email
        gender = $user.gender
        ip_address = $user.ip_address
        nimi = $nimi
        kasutajanimi = $kasutajanimi
        uus_email = $email
        parool = $parool
    }
    $results += $result
}

# Ekspordime tulemused uude csv faili
$results | Export-Csv -Path "processed_users.csv" -NoTypeInformation