param(
  [Parameter(Mandatory = $false)]
  [Switch]$Uninstall
)

$ErrorActionPreference = 'SilentlyContinue'
$PathExists = Test-Path $global:SolrRoot

$solrParams = @{
  Path            = "$global:SCInstallRoot\configs\Solr-SingleDeveloper.json"
  SolrPort        = $global:SOLRPort
  SolrVersion     = $global:SOLRVersion
  SolrServiceName = $global:SolrService
  SolrPath        = $global:SolrRoot
  SolrHostName    = $global:SolrHostName
  PfxPath         = $global:CertPfxPath  
}

$str = $solrParams | Out-String
$global:SolrRoot

Write-Host "SOLR Install Params"
Write-Host "-----------------------------------------------------------------------------------"
Write-Host $str
Write-Host "-----------------------------------------------------------------------------------"

Push-Location .\configs
try {

  if ($Uninstall -eq $false) {
    if (-not $PathExists) {
      Install-SitecoreConfiguration @solrParams -ErrorAction SilentlyContinue
    }
  }
  else {
    Write-Host "Uninstalling Solr"
    Uninstall-SitecoreConfiguration @solrParams
  }
}
finally {
  Pop-Location
}