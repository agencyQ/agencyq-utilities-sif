Set-ExecutionPolicy -Scope CurrentUser Unrestricted

$Repo = @{
    Name               = "SitecoreGallery"
    SourceLocation     = "https://sitecore.myget.org/F/sc-powershell/api/v2"
    InstallationPolicy = "Trusted"
}

try {
    Set-PSRepository @Repo
}
catch {
    Register-PSRepository @Repo
}

Install-Module SitecoreInstallFramework
Install-SitecoreConfiguration -Path .\configs\prerequisites.json