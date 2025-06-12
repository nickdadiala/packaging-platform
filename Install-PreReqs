$PreRequities =@(
@{Name ="DotNetFramework"; Check ="Get-ItemProperty -path'HKLM\SOftware\Microsoft\Net Framework Setup\NDP\V4 -Name Verion -ErrorAction SilentlyContinue"; Install="Start-Process -Filepath 'C:\path\to\DotNetFramework.exe' -ArgumentList /quiet -Wait"},
@{Name ="Java SE Runtime Environment 85"; check="Get-Itemproperty -Path 'HKLM\Software\Microsoft\WOW64Node\Java\v85 -Name Version -ErrorAction SilentlyContinue"; Install="Start-Process -Filepath 'C:\path\to\Jrexwindowsx85.exe' -ArgumentList /quiet -wait"}
)
#Check and Install prereqs
foreach($prereqs in $PreRequities){
    Write-Output "check $($prereqs.name)"
   If(-not(Invoke-Expression $prereqs.check)){
  Write-Output "$($prereqs.name)not found...installing"
  Invoke-Expression $prereqs.Install..
   } else {
    Write-Output "$($prereqs.name) is installed"  
   } 
} 
Write-Output "All PreRequisties are installed" 
#Define install main package declare variables
function test
{
  $mainpackagePath = 'path to main package'
    Write-Output  $mainpackagePath
}
function test
{
 $mainpackageArgs = 'params for package'
  Write-Output $mainpackageArgs
}
# install main package
$mainpackagePath ="C:\path\to\Installer.exe"
$mainpackageArgs ="/quiet /default"

Write-Output "Installing main package"
Start-process msiexec /i -ArgumentList \`"installer.msi`" /quiet -wait
#start-process -Filepath 'C:\path\to\installer.exe' -ArgumentList /quiet /default -wait -NoNewWindow