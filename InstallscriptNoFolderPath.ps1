# Define prerequisites and installation commands without folder path
$prerequisites = @(
    @{ Name = "DotNetFramework"; Check = "Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' -Name Version -ErrorAction SilentlyContinue"; Install = "Start-Process -FilePath '.\DotNetInstaller.exe' -Wait" },
    @{ Name = "Visual C++ Redistributable"; Check = "Test-Path 'C:\Program Files (x86)\Microsoft Visual Studio\VC\Redist\MSVC\*'"; Install = "Start-Process -FilePath '.\VCRedistInstaller.exe' -Wait" }
)

# Check and install prerequisites
foreach ($prereq in $prerequisites) {
    Write-Output "Checking for $($prereq.Name)..."
    if (-not (Invoke-Expression $prereq.Check)) {
        Write-Output "$($prereq.Name) not found. Installing..."
        Invoke-Expression $prereq.Install
    } else {
        Write-Output "$($prereq.Name) is already installed."
    }
}

Write-Output "All prerequisites installed successfully. Proceeding with main package installation."

# Install main package assuming the installer is in the current directory
$mainPackage = ".\MainInstaller.exe"
$mainPackageArgs = "/silent /default"

Write-Output "Installing main package..."
Start-Process -FilePath $mainPackage -ArgumentList $mainPackageArgs -Wait -NoNewWindow

Write-Output "Installation completed."