# To Export the ObjectID from the AAD for each user run the script"UserObjectID.ps1"
Connect-Module -Microrgaph
$check= Read-Host "Micrograph Module Installed"
If (-not(Install-Module -Micrograph).$check) {
}
  Install-Module -Microrgaph
Write-Output -check(-Microrgaph) is installed...

Get-Aduser -filter {-Department= 'ObjectID'}, {-Department='IT'}, {-Department='All'} | Format-Table Name, UserID, ObjectID.

Write-Output "ExportObjectID.csv "
