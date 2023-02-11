param(
  [Parameter(Mandatory = $false)]
  [Switch]$Uninstall
)

.\_params.ps1

New-Item -ItemType Directory -Force -Path "logs"

if ($Uninstall -eq $false) {
  .\_download.ps1
  .\_certs.ps1
  .\_solr.ps1
  .\_single.ps1
}
else {
  .\_single.ps1 -Uninstall
  .\_solr.ps1 -Uninstall
}

