$ProgressPreference = 'SilentlyContinue'

$sourcesFolder = ".\sources"

if (-Not (Test-Path $sourcesFolder)) {

  $outputFileMain = Join-Path $sourcesFolder "Sitecore.zip"
  $outputFileSXA = Join-Path $sourcesFolder "Sitecore.SXA.zip"
  $outputFilePSE = Join-Path $sourcesFolder "Sitecore.PSE.zip"
  $outputFileHeadlessCM = Join-Path $sourcesFolder "Sitecore.Headless.CM.zip"
  $outputFileMgmt = Join-Path $sourcesFolder "Sitecore.Mgmt.Svc.zip"

  New-Item -ItemType Directory -Force -Path $sourcesFolder

  Invoke-WebRequest -URI "https://sitecoredev.azureedge.net/~/media/F822AC26C1AC4805BA78E36E82545093.ashx?date=20221124T084005" -OutFile $outputFileMain
  Invoke-WebRequest -URI "https://sitecoredev.azureedge.net/~/media/195F299EF0864E97886722802D748783.ashx?date=20221129T182654" -OutFile $outputFileSXA
  Invoke-WebRequest -URI "https://sitecoredev.azureedge.net/~/media/4E5738C6BB6A430EB5DB93ABE946A49D.ashx?date=20221129T101820" -OutFile $outputFilePSE
  Invoke-WebRequest -URI "https://sitecoredev.azureedge.net/~/media/056B4B068ACC4FD9B0286F07B129E795.ashx?date=20221102T125207" -OutFile $outputFileHeadlessCM
  Invoke-WebRequest -URI "https://sitecoredev.azureedge.net/~/media/7B29DB68C23D49268DCBD2D2404D91C0.ashx?date=20221012T174033" -OutFile $outputFileMgmt

  Expand-Archive -LiteralPath $outputFileMain -DestinationPath $sourcesFolder -Force
}