Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Add-Type -AssemblyName Microsoft.VisualBasic

if ($PSVersionTable.PSVersion.Major -ge 7)
{
  Import-Module Appx -UseWindowsPowerShell
}

if (Get-AppxPackage -Name SpotifyAB.SpotifyMusic)
{
  Write-Host "The Microsoft Store version of Spotify has been detected which is not supported."

  $store = [Microsoft.VisualBasic.Interaction]::MsgBox('Uninstall MS Store Spotify?', 'YesCancel,MsgBoxSetForeground,Critical,SystemModal', 'MS Store Spotify is not supported');
  if ($store -eq 'Yes')
  {
    Write-Host "Uninstalling Spotify.`n"
    Get-AppxPackage -Name SpotifyAB.SpotifyMusic | Remove-AppxPackage
  }
  else
  {
    Write-Host "Operation Cancelled"
    exit
  }
}

function RefreshPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") +
                ";" +
                [System.Environment]::GetEnvironmentVariable("Path","User")
}

$git = [Microsoft.VisualBasic.Interaction]::MsgBox('Is Git installed in your system?', 'YesNoCancel,MsgBoxSetForeground,Question,SystemModal', 'Git Installation');

if ($git -eq 'Yes') {
Write-Host "`nSkipping Git installation"
}

if ($git -eq 'No') {
Write-Host "`nDownloading Git installer"
Start-Process "https://git-scm.com/download/win"
Write-Host "Please install Git using the downloaded installer and come back here once done.`n"
Read-Host "If Git was installed, press enter to continue"
RefreshPath
}

if ($git -eq 'Cancel') {
Write-Host "`nOperation Cancelled"
exit
}


$spice = [Microsoft.VisualBasic.Interaction]::MsgBox('Is Spicetify CLI installed in your system?', 'YesNoCancel,MsgBoxSetForeground,Question,SystemModal', 'Spicetify CLI Installtion');

if ($spice -eq 'Yes') {
 Write-Host "`nSkipping Spicetify installation`n"
 spicetify upgrade
 Write-Host "Installing theme`n"
 Set-Location "$(spicetify -c | Split-Path)\Themes"
 git clone https://github.com/Daksh777/SpotifyNoPremium
 spicetify config current_theme SpotifyNoPremium
 spicetify restore
 spicetify clear
 spicetify backup apply
 Write-Host "`nInstalled successfully"
 }

 if ($spice -eq 'No') {
 Write-Host "`nInstalling Spicetify CLI`n"
 Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
 Write-Host "`n Installed Spicetify CLI`n"
 RefreshPath
 Write-Host "Installing the theme`n"
 Set-Location "$(spicetify -c | Split-Path)\Themes"
 git clone https://github.com/Daksh777/SpotifyNoPremium
 spicetify config current_theme SpotifyNoPremium
 spicetify clear
 spicetify backup apply
 Write-Host "`n Installed theme successfully"
 }

 if ($spice -eq 'Cancel') {
 Write-Host "`nOperation Cancelled"
 exit
}


$bts = [Microsoft.VisualBasic.Interaction]::MsgBox('Do you want to install BlockTheSpot to block ads? (Recommended)', 'YesNoCancel,MsgBoxSetForeground,Question,SystemModal,DefaultButton1', 'BlockTheSpot Installation');

if ($bts -eq 'Yes') {
Invoke-WebRequest -Uri "https://github.com/Daksh777/BlockTheSpot/raw/master/SpotifyNoPremium.ps1" -OutFile "SpotifyNoPremium.ps1"
.\SpotifyNoPremium.ps1
Remove-Item "SpotifyNoPremium.ps1"
}

if ($bts -eq 'No') {
 Write-Host "`nNot installing BlockTheSpot"
 exit
}

 if ($spice -eq 'Cancel') {
 Write-Host "`nOperation Cancelled"
 exit
 }
