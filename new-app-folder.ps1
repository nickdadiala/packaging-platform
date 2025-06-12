$ErrorActionPreference = "Stop"
$sourceTemplate = ".\application-template"

if(-not (Test-path $sourceTemplate -PathType Container)) {

}

$applicationName = Read-Host "Enter new application name, no whitespaces"

if([string]::IsNullOrWhiteSpace($applicationName)) {
    throw "no application name entered"
}

foreach($charitem in $applicationName.ToCharArray()) {
    if([string]::IsNullOrWhiteSpace($charitem.ToString())) {
        throw "whitespace characters not allowed"
    }
}