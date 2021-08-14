Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Write-Host "Updating theme from GitHub repo"
Set-Location "$(spicetify -c | Split-Path)\Themes\SpotifyNoPremium"
git pull origin
spicetify update

Write-Host "`nInstalling Spicetify fix"
Invoke-WebRequest -Uri "https://github.com/itsmeowForks/spicetify-cli/releases/download/v2.5.0-patch4/spicetify-2.5.0-itsmeow-patch4-windows-x64.zip" -OutFile "spicetify-fix.zip"
Expand-Archive -Path spicetify-fix.zip
Remove-Item "spicetify-fix.zip"
Copy-Item -Path spicetify-fix\* -Destination $home\.spicetify -Recurse -Force
Remove-Item spicetify-fix -Recurse -Force

Write-Host "`nUpdated theme successfully"

Add-Type -AssemblyName PresentationFramework
$bts = [System.Windows.MessageBox]::Show('Do you want to install BlockTheSpot to block ads? (Recommended)', 'BlockTheSpot Installation', 'YesNoCancel');

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
