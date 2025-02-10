# Funktsioon - Ringi pindala
function Ringi-Pindala {
    param (
        [float]$Raadius
    )

    if ($Raadius -le 0) {
        Write-Host "Raadius peab olema suurem kui 0."
        return
    }

    $Pindala = [math]::PI * $Raadius * $Raadius
    return $Pindala
}

# Kasutaja sisendi saamine
$raadius = Read-Host "Palun sisestage ringi raadius"

# Proovime konverteerida sisendi numbriks
if ($raadius -as [float]) {
    $pindala = Ringi-Pindala -Raadius $raadius
    Write-Host "Ringi pindala raadiusega $raadius on $pindala."
} else {
    Write-Host "Palun sisestage kehtiv number raadiuse jaoks."
}

function Puhasta-Taisnimi {
    param (
        [string]$Taisnimi
    )

    # Asenda täpitähed vastavalt soovile
    $puhastatudNimi = $Taisnimi -replace 'ä', 'a' `
                                  -replace 'ö', 'o' `
                                  -replace 'õ', 'o' `
                                  -replace 'ü', 'y'

    # Eemalda kõik mitte-kirjad
    $puhastatudNimi = $puhastatudNimi -replace '[^\p{L} ]', '' # Eemaldab kõik mitte-tähed
    $puhastatudNimi = $puhastatudNimi -replace '\s+', ' '     # Asendab mitu tühikut ühe tühikuga
    $puhastatudNimi = $puhastatudNimi.Trim()                  # Eemaldab tühikud algusest ja lõpust

    # Muuda nime iga sõna esitäht suureks ja ühenda sõnad kokku
    $puhastatudNimi = -join ($puhastatudNimi -split ' ' | ForEach-Object { 
        if ($_ -ne '') { 
            $_.Substring(0, 1).ToUpper() + $_.Substring(1).ToLower() 
        }
    })

    return $puhastatudNimi
}

# Kasutajalt nime küsimine
$nimeSisend = Read-Host "Palun sisestage oma täisnimi (kasutage täpitähti, kui on vajalik)"

# Funktsiooni kutsumine ja tulemuse väljastamine
$puhastatudNimi = Puhasta-Taisnimi -Taisnimi $nimeSisend
Write-Host "Puhastatud nimi: $puhastatudNimi"