# Set the licensing mode and license server name
$licenseServer = "YourLicenseServerName"
$licensingMode = 2  # 2 = Per Device, 4 = Per User

# Set the license server name in the registry
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\Licensing Core" `
    -Name "LicenseServers" -Value @{ $licenseServer = "" }

# Set the licensing mode
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\Licensing Core" `
    -Name "LicensingMode" -Value $licensingMode

# set example of app ArcGIS Pro to address license server details for it. 
# Set ArcGIS License Server Environment Variable for Current User
[System.Environment]::SetEnvironmentVariable("ARCGIS_LICENSE_FILE", "27000@yourLicenseServer", "User")

# Optional: Set for All Users (requires admin privileges)
[System.Environment]::SetEnvironmentVariable("ARCGIS_LICENSE_FILE", "27000@yourLicenseServer", "Machine")   