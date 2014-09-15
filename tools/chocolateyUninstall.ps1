# HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
$msiId = '{C484CC8D-03CF-4022-89C4-DB4F02E8A15B}'

$package = 'CrystalReports2008Runtime'

try {
  
  Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId /qb" -validExitCodes @(0) 
  # the following is all part of error handling
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 
}