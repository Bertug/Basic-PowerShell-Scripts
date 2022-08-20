
#$computerName = Read-Host "Enter host name"
$computerName = Get-ComputerInfo | Select-Object -ExpandProperty CsDNSHostName 
$StoppedService = Get-Service -ComputerName $computerName | Where-Object -Property Status -eq "Stopped"
Write-Output $StoppedService
#$StoppedService | Out-File StoppedService.txt