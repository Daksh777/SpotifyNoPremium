Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Add-Type -AssemblyName PresentationFramework
$git = [System.Windows.MessageBox]::Show('Is Git installed in your system?', 'Git Installation', 'YesNoCancel');

if ($git -eq 'Yes') {
Write-Host "`nSkipping Git installation"
}

if ($git -eq 'No') {
Write-Host "`nDownloading Git installer"
Start-Process "https://git-scm.com/download/win"
Write-Host "Please install Git using the downloaded installer and come back here once done.`n"
Read-Host "If Git was installed, press enter to continue"
}

if ($git -eq 'Cancel') {
Write-Host "`nOperation Cancelled"
exit
}


Add-Type -AssemblyName PresentationFramework
$input = [System.Windows.MessageBox]::Show('Is Spicetify CLI installed in your system?', 'Spicetify CLI Installtion', 'YesNoCancel');

if ($input -eq 'Yes') {
 Write-Host "`nSkipping Spicetify installation`n"
 Write-Host "Installing theme`n"
 spicetify upgrade
 cd "$(spicetify -c | Split-Path)\Themes"
 git clone https://github.com/Daksh777/SpotifyNoPremium
 spicetify config current_theme SpotifyNoPremium
 spicetify apply
 Write-Host "`nInstalled successfully"
 Read-Host "Press enter to exit"
 }

 if ($input -eq 'No') {
 Write-Host "`nInstalling Spicetify CLI`n"
 Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
 Write-Host "`n Installed Spicetify CLI`n"
 Write-Host "Installing the theme`n"
 cd "$(spicetify -c | Split-Path)\Themes"
 git clone https://github.com/Daksh777/SpotifyNoPremium
 spicetify config current_theme SpotifyNoPremium
 spicetify apply
 Write-Host "`n Installed theme successfully"
 Write-Host "`n Press enter to exit"
 }

 if ($input -eq 'Cancel') {
 Write-Host "`nOperation Cancelled"
exit
}
