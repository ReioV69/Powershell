# Loeme XML faili
[xml]$customers = Get-Content -Path "customers.xml"

# Sorteerime välja Poolas elavad kliendid
$poland_customers = $customers.customers.customer | Where-Object { $_.country -eq "Poland" }

# Kuvame Poolas elavate klientide nimed
foreach ($customer in $poland_customers) {
    Write-Output $customer.full_name
}