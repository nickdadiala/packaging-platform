# To Export the ObjectID from the AAD for each user run the script"UserObjectID.ps1"
#Connect-Module -Microrgaph
$prerequisites= @(
    @{Name= "Micrograph"; check="Get-ItemProperty -Path 'HKLM\Software\Microsoft\Windows\Powershell -Name version -ErrorAction -SilentlyContinue'"; Install="Start-process -Filepath C:\Windows\Powershell"}
)
 foreach($prereqs in $prerequisites) {
    Write-Output "checck$($prereqs.name)"
    if(-not(Invoke-Expression $prereqs.check)){
        Write-Output $($prereqs.name) not installed
    }
 }


Get-Aduser -filter {-Department= 'All IT'}, {-Department='IT'}, {-Department='All'} | Format-Table Name, UserID, ObjectID.

Write-Output "ExportObjectID.csv "

Get-Aduser -Filter {Deparatment= 'Finance'}