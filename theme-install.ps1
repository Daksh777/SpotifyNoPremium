Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Add-Type -AssemblyName PresentationFramework
$spice = [System.Windows.MessageBox]::Show('Is Spicetify CLI installed in your system?', 'Spicetify CLI Installtion', 'YesNoCancel');

if ($spice -eq 'Yes') {
 Write-Host "`nSkipping Spicetify installation`n"
 Write-Host "Installing theme`n"
 spicetify upgrade
 cd "$(spicetify -c | Split-Path)\Themes"
 git clone https://github.com/Daksh777/SpotifyNoPremium
 spicetify config current_theme SpotifyNoPremium
 spicetify restore backup apply
 Write-Host "`nInstalled successfully"
 }

 if ($spice -eq 'No') {
 Write-Host "`nInstalling Spicetify CLI`n"
 Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
 Write-Host "`n Installed Spicetify CLI`n"
 Write-Host "Installing the theme`n"
 cd "$(spicetify -c | Split-Path)\Themes"
 git clone https://github.com/Daksh777/SpotifyNoPremium
 spicetify config current_theme SpotifyNoPremium
 spicetify restore backup apply
 Write-Host "`n Installed theme successfully"
 }

 if ($spice -eq 'Cancel') {
 Write-Host "`nOperation Cancelled"
 exit
}


Add-Type -AssemblyName PresentationFramework
$bts = [System.Windows.MessageBox]::Show('Do you want to install BlockTheSpot to block ads? (Recommended)', 'BlockTheSpot Installation', 'YesNoCancel');

if ($bts -eq 'Yes') {
Invoke-WebRequest -Uri "https://github.com/Daksh777/BlockTheSpot/raw/master/SpotifyNoPremium.bat" -OutFile "SpotifyNoPremium.bat"
cmd.exe /c ".\SpotifyNoPremium.bat"
Remove-Item "SpotifyNoPremium.bat"
}

if ($bts -eq 'No') {
 Write-Host "`nNot installing BlockTheSpot"
 exit
}

 if ($spice -eq 'Cancel') {
 Write-Host "`nOperation Cancelled"
 exit
}
