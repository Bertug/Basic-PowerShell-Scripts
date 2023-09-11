Import-Module ImportExcel


# Specify the path to your JSON file
$jsonFilePath = "some.json"
# Read the JSON data from the file
$jsonData = Get-Content -Path $jsonFilePath | Out-String | ConvertFrom-Json

# Create a custom table with all properties
$table = @()
foreach ($item in $jsonData) {
    $row = New-Object PSObject
    foreach ($property in $item.PSObject.Properties) {
        $row | Add-Member -MemberType NoteProperty -Name $property.Name -Value $property.Value
    }
    $table += $row
}

# Display the resulting table in a graphical window
$table | Export-Excel -Path "C:\output1.xlsx" -WorksheetName "Data"
