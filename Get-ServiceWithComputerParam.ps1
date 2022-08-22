param (
    [Parameter(Mandatory=$true)]
    [string[]]
    $ComputerName
)

#There might be more than one computer, therefore loop them with foreach
foreach($target in $ComputerName){
    Get-Service -ComputerName $target | Where-Object -Property Status -eq "Stopped"
}