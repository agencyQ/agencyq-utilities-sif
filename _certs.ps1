Install-Module -Name Posh-ACME -Scope CurrentUser -Force

$pArgs = @{
  CFToken = (ConvertTo-SecureString -String "$env:CloudFlareToken" -AsPlainText -Force)
}
$global:CertThumbprint = ""
$global:CertThumbprint = (Get-ChildItem  -Path Cert:\LocalMachine\MY | Where-Object { $_.FriendlyName -Eq "$global:Prefix.agencyq.dev" } | Where-Object { $_.NotAfter -gt (get-date) } | Sort-Object NotAfter | Select-Object Thumbprint -last 1).Thumbprint

if ($global:CertThumbprint) {
  Write-Host "Certificate already exists, skipping creation"
  $IssuedCertInfo = (Get-PACertificate -List | Where-Object { $_.Thumbprint -Eq $global:CertThumbprint })
}
else {
  
  $CertificatePassword = 'AgencyQ007!'

  $names = @("*.$global:Prefix.agencyq.dev", "$global:Prefix.agencyq.dev", "*.$env:computername.agencyq.dev")
  $IssuedCertInfo = New-PACertificate $names -AcceptTOS -Contact 'admin@agencyq.dev' -DnsPlugin Cloudflare -PluginArgs  $pArgs -Verbose -Force -Install -PfxPass $CertificatePassword -FriendlyName "$global:Prefix.agencyq.dev" -DnsSleep 30

  $global:CertThumbprint = $IssuedCertInfo.Thumbprint
}


$IssuedCertInfo | Format-List


$certFolder = "..\.certificates"
New-Item -ItemType Directory -Force -Path $certFolder

Copy-Item -Path $IssuedCertInfo.CertFile -Destination $certFolder -Force
Copy-Item -Path $IssuedCertInfo.KeyFile -Destination $certFolder -Force
Copy-Item -Path $IssuedCertInfo.ChainFile -Destination $certFolder -Force
Copy-Item -Path $IssuedCertInfo.FullChainFile -Destination $certFolder -Force
Copy-Item -Path $IssuedCertInfo.PfxFile -Destination $certFolder -Force
Copy-Item -Path $IssuedCertInfo.PfxFullChain -Destination $certFolder -Force


$global:CertPfxPath = (Get-ChildItem "$certFolder\fullchain.pfx").FullName