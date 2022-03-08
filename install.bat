;;;===,,,@echo off
;;;===,,,findstr /v "^;;;===,,," "%~f0" > "%~dp0ps.ps1"
;;;===,,,PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dp0ps.ps1'"
;;;===,,,del /s /q "%~dp0ps.ps1" >NUL 2>&1
;;;===,,,pause
;;;===,,,exit

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

Write-Host @'
Author: @Daksh777
Website: https://daksh.eu.org
'@`n

Add-Type -AssemblyName Microsoft.VisualBasic

if ($PSVersionTable.PSVersion.Major -ge 7)
{
  Import-Module Appx -UseWindowsPowerShell
}

if (Get-AppxPackage -Name SpotifyAB.SpotifyMusic) {
  Write-Host "The Microsoft Store version of Spotify has been detected which is not supported."
  $store = [Microsoft.VisualBasic.Interaction]::MsgBox('Uninstall MS Store Spotify?', 'YesCancel,MsgBoxSetForeground,Critical,SystemModal', 'MS Store Spotify is not supported');
  
  if ($store -eq 'Yes') {
    Write-Host "Uninstalling Spotify.`n"
    Get-AppxPackage -Name SpotifyAB.SpotifyMusic | Remove-AppxPackage
    $installspot = [Microsoft.VisualBasic.Interaction]::MsgBox('Install official Spotify?', 'YesCancel,MsgBoxSetForeground,Critical,SystemModal', 'Official Spotify installation');
    
    if ($installspot -eq 'Yes') {
      Write-Host 'Downloading the latest Spotify full setup, please wait...'
      $spotifySetupFilePath = Join-Path -Path $PWD -ChildPath 'SpotifyFullSetup.exe'
      Invoke-WebRequest -Uri 'https://download.scdn.co/SpotifyFullSetup.exe' -OutFile $spotifysetupfilepath
      Start-Process $spotifySetupFilePath
      }

    else {
        Write-Host "Operation Cancelled"
        exit
        }
  }

  else {

        Write-Host "Operation Cancelled"
        exit
  }
}

function RefreshPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") +
                ";" +
                [System.Environment]::GetEnvironmentVariable("Path","User")
}


$spice = [Microsoft.VisualBasic.Interaction]::MsgBox('Is Spicetify CLI installed in your system?', 'YesNoCancel,MsgBoxSetForeground,Question,SystemModal', 'Spicetify CLI Installtion');

if ($spice -eq 'Yes') {
 Write-Host "`nSkipping Spicetify installation and checking for updates `n"
 RefreshPath
 spicetify restore
 spicetify upgrade
 }

if ($spice -eq 'No') {
 Write-Host "`nInstalling Spicetify CLI`n"
 Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1" | Invoke-Expression
 Write-Host "`n Installed Spicetify CLI`n"
 RefreshPath
 }

if ($spice -eq 'Cancel') {
 Write-Host "`nOperation Cancelled"
 exit
}

Write-Host 'Downloading files from GitHub repository'
Invoke-WebRequest -Uri 'https://github.com/Daksh777/SpotifyNoPremium/archive/main.zip' -OutFile 'temp.zip'
Expand-Archive 'temp.zip'
Remove-Item 'temp.zip'
Rename-Item -Path temp/SpotifyNoPremium-main -NewName SpotifyNoPremium
Move-Item -Path temp/SpotifyNoPremium -Destination "$(spicetify -c | Split-Path)\Themes" -Force
Remove-Item temp -Recurse -Force
Write-Host "`nDownloaded successfully"

Write-Host 'Setting theme'
Set-Location "$(spicetify -c | Split-Path)\Themes"
spicetify config current_theme SpotifyNoPremium
spicetify backup apply
Write-Host "`nInstalled successfully"



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
