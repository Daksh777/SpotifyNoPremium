;;;===,,,@echo off
;;;===,,,findstr /v "^;;;===,,," "%~f0" > "%~dp0ps.ps1"
;;;===,,,PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dp0ps.ps1'"
;;;===,,,del /s /q "%~dp0ps.ps1" >NUL 2>&1
;;;===,,,pause
;;;===,,,exit

Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Add-Type -AssemblyName Microsoft.VisualBasic

Write-Host "Updating theme from GitHub repo"
Set-Location "$(spicetify -c | Split-Path)\Themes\SpotifyNoPremium"
git pull origin

Write-Host "`nUpdating Spicetify"
spicetify upgrade
spicetify restore
spicetify clear
spicetify backup apply

Write-Host "`nUpdated theme successfully"

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
