param(
  [Parameter(Mandatory = $false)]
  [Switch]$Uninstall
)

Write-Host "SCInstallRoot:   $global:SCInstallRoot"

$SiteCoreContentManagementPackage = (Get-ChildItem "$global:SCInstallRoot\sources\Sitecore * rev. * (XM) (OnPrem)_cm.*scwdp.zip").FullName

$SXAPackage = (Get-ChildItem "$global:SCInstallRoot\sources\Sitecore.SXA.zip").FullName
$SPEPackage = (Get-ChildItem "$global:SCInstallRoot\sources\Sitecore.PSE.zip").FullName
$HeadlessPackage = (Get-ChildItem "$global:SCInstallRoot\sources\Sitecore.Headless.CM.zip").FullName
$ManagementPackge = (Get-ChildItem "$global:SCInstallRoot\sources\Sitecore.Mgmt.Svc.zip").FullName
$IdentityPackage = (Get-ChildItem "$global:SCInstallRoot\sources\Sitecore.IdentityServer *.scwdp.zip").FullName

$IdentityPackage

$singleDeveloperParams = @{
  Path                   = "$global:SCInstallRoot\configs\sitecore-xm0.json"
  SqlServer              = $global:SqlServer
  SqlAdminUser           = $global:SqlAdminUser
  SqlAdminPassword       = $global:SqlAdminPassword
  SitecoreAdminPassword  = $global:SitecoreAdminPassword
  SolrUrl                = $global:SolrUrl
  SolrRoot               = $global:SolrRoot
  SolrService            = $global:SolrService
  Prefix                 = $global:Prefix
  LicenseFile            = $global:LicenseFile
  Package                = $SiteCoreContentManagementPackage
  SiteName               = $global:SitecoreContentManagementSitename
  IdentityServerSiteName = $global:IdentityServerSiteName
  Update                 = $global:Update
  SPEPackage             = $SPEPackage
  SXAPackage             = $SXAPackage
  HeadlessPackage        = $HeadlessPackage
  ManagementPackage      = $ManagementPackge
  IdentityPackage        = $IdentityPackage
  SSLCert                = $global:CertThumbprint
  PasswordRecoveryUrl    = $global:PasswordRecoveryUrl
  AllowedCorsOrigins     = $global:AllowedCorsOrigins
  ClientSecret           = $global:ClientSecret
}

Push-Location .\configs
try {

  if ($Uninstall -eq $false) {
    Install-SitecoreConfiguration @singleDeveloperParams *>&1 | Tee-Object sitecore-xm0.log
  }
  else {
    Uninstall-SitecoreConfiguration @singleDeveloperParams *>&1 | Tee-Object sitecore-xm0-Uninstall.log
  }
}
finally {
  Pop-Location
}
