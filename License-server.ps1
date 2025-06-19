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

#####this can be added before the main package execute below is set example of how to####
<#
.SYNOPSIS
    Sets ArcGIS License Server details before running installation or main package.

.DESCRIPTION
    This script ensures the ArcGIS environment is configured to point to the correct license server
    before proceeding with installation or execution of ArcGIS-related tools.
#>

# --- Configure ArcGIS License Server ---
$licenseServer = "27000@yourLicenseServer"  # Replace with actual server address

# Set environment variable for current user
[System.Environment]::SetEnvironmentVariable("ARCGIS_LICENSE_FILE", $licenseServer, "User")

# Optional: Set for all users (requires admin)
[System.Environment]::SetEnvironmentVariable("ARCGIS_LICENSE_FILE", $licenseServer, "Machine")

Write-Output "ArcGIS license server has been configured: $licenseServer"

# --- Begin Main Package Execution ---
# Example: Start-Process -FilePath "C:\Path\To\Setup.exe" -ArgumentList "/quiet"