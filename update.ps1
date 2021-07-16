Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Write-Host "Updating theme from GitHub repo"
cd "$(spicetify -c | Split-Path)\Themes\SpotifyNoPremium"
git pull origin

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
