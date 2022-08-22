
param (
    [Parameter(Mandatory=$true)]
    [string[]]
    $ComputerName
)
 
$services = Get-Service -ComputerName $ComputerName

foreach ($service in $services) {

    $ServiceStatus = $service.Status
    $ServiceName = $service.Name
    $ServiceDisplayName = $service.DisplayName

    if ($ServiceStatus -eq "Running"){Write-Output "Service $ServiceName OK - Status of $ServiceDisplayname is $ServiceStatus "}
    else {Write-Output "Check Service $ServiceName - Status of $ServiceDisplayName is $ServiceStatus"}
}


