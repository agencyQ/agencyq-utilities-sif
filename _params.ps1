# The Prefix that will be used on SOLR, Website and Database instances.
$global:Prefix = "sif-install"
$global:SOLRPort = "8985"
$global:SOLRVersion = "8.11.2"

$global:RootPath = "C:\inetpub"

# The Password for the Sitecore Admin User. This will be regenerated if left on the default.
$global:SitecoreAdminPassword = "b"
# The root folder with the license file and WDP files.
$global:SCInstallRoot = (Get-Location).Path
# Alternate root folder to install websites. If left on default [systemdrive]:\inetpub\wwwroot\ will be used.
$global:SitePhysicalRoot = Join-Path $global:RootPath "wwwroot"
# The name for the Sitecore Content Delivery server.
$global:SitecoreContentManagementSitename = "cm.$global:Prefix.agencyq.dev"
# The name for the Sitecore Content Management Server.
$global:SitecoreContentDeliverySitename = "cd.$global:Prefix.agencyq.dev"
# Identity Server site name
$global:IdentityServerSiteName = "id.$global:Prefix.agencyq.dev"
# The Path to the license file
$global:LicenseFile = "$global:SCInstallRoot\license.xml"
$global:SolrHostName = "solr.$global:Prefix.agencyq.dev:$global:SOLRPort"
# The URL of the Solr Server
$global:SolrUrl = "https://$global:SolrHostName:$global:SOLRPort/solr"
# The Name of the Solr Service.
$global:SolrService = "solr-$global:Prefix-$global:SOLRVersion"
# The Folder that Solr has been installed in.
$global:SolrRoot = "$global:SitePhysicalRoot\$global:SolrService"
# The DNS name or IP of the SQL Instance.
$global:SqlServer = "localhost"
# A SQL user with sysadmin privileges.
$global:SqlAdminUser = "sa"
# The password for $SQLAdminUser.
$global:SqlAdminPassword = "Password123!"
# The Identity Server password recovery URL, this should be the URL of the CM Instance
$global:PasswordRecoveryUrl = "https://$global:SitecoreContentManagementSitename"
# The URL of the Identity Authority
$global:SitecoreIdentityAuthority = "https://$global:IdentityServerSiteName"
# The random string key used for establishing connection with IdentityService. This will be regenerated if left on the default.
$global:ClientSecret = "SIF-Default"
# Pipe-separated list of instances (URIs) that are allowed to login via Sitecore Identity.
$global:allowedCorsOrigins = "https://$global:SitecoreContentManagementSitename"
# The parameter for the installing delta WDP packages
$global:Update = $false
# The elastic pool name for deploy databases from the SQL Azure.
$global:DeployToElasticPoolName = ""


Write-Host "Setting Sitecore Install Params"
Write-Host "SCInstallRoot:   $global:SCInstallRoot"
Write-Host "SitePhysicalRoot:   $global:SitePhysicalRoot"
Write-Host "SitecoreContentManagementSitename:   $global:SitecoreContentManagementSitename"
Write-Host "SitecoreContentDeliverySitename:   $global:SitecoreContentDeliverySitename"
Write-Host "IdentityServerSiteName:   $global:IdentityServerSiteName"
Write-Host "LicenseFile:   $global:LicenseFile"
Write-Host "SiteCoreContentManagementPackage:   $global:SiteCoreContentManagementPackage"
Write-Host "SitecoreContentDeliveryPackage:   $global:SitecoreContentDeliveryPackage"
Write-Host "IdentityServerPackage:   $global:IdentityServerPackage"
Write-Host "PasswordRecoveryUrl:   $global:PasswordRecoveryUrl"
Write-Host "SitecoreIdentityAuthority:   $global:SitecoreIdentityAuthority"
Write-Host "SolrUrl:   $global:SolrUrl"
Write-Host "SolrRoot:   $global:SolrRoot"
Write-Host "SolrService:   $global:SolrService"
Write-Host "SqlServer:   $global:SqlServer"
