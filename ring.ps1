Write "Calc Mode"
Write "AREA CIRCLE"
$a = Read-Host "Choose Calc Mode"
if ($a -eq "circle")
{
 
Get-AreaCircle
 
}
 
Function Get-AreaCircle{
$radius = 0; $pi = [math]::PI; $area =0
$radius = Read-Host "What is the radius of the circle"
$area = [int]$radius*[int]$radius*$pi
Write "Area = $area"
}
