
<#
.Synopsis
Gather information
.DESCRIPTION

.EXAMPLE

#>
## OS Description
$ComputerName = (Get-ComputerInfo).CSname
$OS = (Get-CimInstance Win32_OperatingSystem).Caption

#Disk free space
$drive = Get-WmiObject -Class win32_logicaldisk | Where-Object DeviceID -eq "C:"
$free = $drive.FreeSpace/1gb
Write-Host "Free space is: $free "


#Amount of System memory
$totalMemory = (((Get-CimInstance Win32_PhysicalMemory).Capacity | Measure-Object -Sum).Sum/1gb)

Write-Host "Total memory is: $totalMemory "

#Last reboot of the system
$LastReboot = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
Write-Host "Last reboot is: $LastReboot "

#IP Address & DNS Name
$dns = Resolve-DnsName -Name $ComputerName| Where-Object Type -eq "A"
#$dns = Resolve-DnsName -Name $ComputerName| Where-Object {$_.Type -eq "A"}
$dnsName = $dns.Name
$dnsIP = $dns.IPAddress

Write-Host "Dns name is: $dnsName and dns IP is: $DnsIP"

