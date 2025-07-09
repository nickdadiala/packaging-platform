# To Export the ObjectID from the AAD for each user run the script"UserObjectID.ps1"
Connect-Module -Microrgaph
If (-not(Install-Module -Microrgaph).$check)
  Install-Module -Microrgaph
Write-Output -check(-Microrgaph) is installed

Get-Aduser -filter {-Department= 'ObjectID'}, {-Department='IT'}, {-Department='All'}


