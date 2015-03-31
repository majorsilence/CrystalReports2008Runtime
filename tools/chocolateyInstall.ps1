$package = 'CrystalReports2008Runtime'

# ------------------------
#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one


$packageName = $package;
$silentArgs = '/quiet';
$url = 'https://smpdl.sap-ag.de/~sapidp/012002523100004495572015D/CRREDIST07_0-10007442.ZIP';


try {



  $chocTempDir = Join-Path $env:TEMP "chocolatey"
  $tempDir = Join-Path $chocTempDir "$packageName"
  $setupMsi = "CRRuntime_12_7_mlb.msi"
  $zipFile = "cr2008sp7_redist.zip"
  
  $tempDownloadFolder 
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
        
  $file = Join-Path $tempDir $zipFile
  Get-ChocolateyWebFile $packageName $file $url
  Get-ChocolateyUnzip $file $tempDir "" $packageName
  
  $fileMsi = Join-Path $tempDir $setupMsi 
  Install-ChocolateyInstallPackage -packageName $packageName -fileType 'msi' -silentArgs $silentArgs -file $fileMsi

  
   # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
