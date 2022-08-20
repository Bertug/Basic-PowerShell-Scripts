#$computerName = Read-Host "Enter host name"
$computerName = Get-ComputerInfo | Select-Object -ExpandProperty CsDNSHostName 

Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computerName | Select-Object -Property CSName, LastBootUpTime