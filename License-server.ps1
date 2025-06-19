# Set the licensing mode and license server name
$licenseServer = "YourLicenseServerName"
$licensingMode = 2  # 2 = Per Device, 4 = Per User

# Set the license server name in the registry
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\Licensing Core" `
    -Name "LicenseServers" -Value @{ $licenseServer = "" }

# Set the licensing mode
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\Licensing Core" `
    -Name "LicensingMode" -Value $licensingMode
