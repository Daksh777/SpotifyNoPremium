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

$css = [Microsoft.VisualBasic.Interaction]::MsgBox('If you have modified any files (like the user.css or color.ini), make sure to back it up right now or it will get deleted. Continue?', 'YesNo,MsgBoxSetForeground,Question,SystemModal,DefaultButton1', 'Backup custom CSS');
if ($css -eq 'No') {
    Write-Host "Please backup any custom files and run this script again"
    exit
    }

Get-ChildItem "$(spicetify -c | Split-Path)\Themes\SpotifyNoPremium" -Exclude .git | Remove-Item -Force

Write-Host 'Downloading files from GitHub repository'
Set-Location C:\Temp
Invoke-WebRequest -Uri 'https://github.com/Daksh777/SpotifyNoPremium/archive/main.zip' -OutFile 'temp.zip'
Expand-Archive 'temp.zip'
Remove-Item 'temp.zip'
Rename-Item -Path temp/SpotifyNoPremium-main -NewName SpotifyNoPremium
Get-ChildItem temp/SpotifyNoPremium | Copy-Item -Destination "$(spicetify -c | Split-Path)\Themes\SpotifyNoPremium" -Force -Recurse
Remove-Item temp -Recurse -Force
Write-Host "`nDownloaded successfully"

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
