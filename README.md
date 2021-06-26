# What is this?
This is a modified Spotify stock theme that removes the `Upgrade` button, the ad placeholder and `Upgrade account` (in the drop down menu) from the Spotify client using the Spicetify CLI. <br>
Supports both old and new UI

> Note: Make sure to use the latest Spicetify CLI and Spotify App. Run `spicetfy upgrade` and then `spicetify backup apply` to update Spicetify to the latest version.

# Installation

## 1. Automatic installation for Windows users
- Run the [full install script](https://raw.githubusercontent.com/Daksh777/SpotifyNoPremium/main/full-install.ps1) which installs Git + Spicetify CLI (both can be cancelled if already installed) + theme. <br> <br>
OR <br> <br>
- Run [theme only install script](https://raw.githubusercontent.com/Daksh777/SpotifyNoPremium/main/theme-install.ps1) which installs only the theme + Spicetify (can be cancelled if already installed)

> Note: I'm not very good at PowerShell scripting and if you face any errors, please create an issue.

## 2. Manual installation for all users
 ### 1. Installing Spicetify CLI
 Installation instructions for Windows, MacOS and Linux can be found [here](https://github.com/khanhas/spicetify-cli/wiki/Installation).
 
 ### 2. Installing Theme
 
#### Linux and MacOS:
In **Bash**:
```bash
cd "$(dirname "$(spicetify -c)")/Themes"
git clone https://github.com/Daksh777/SpotifyNoPremium
spicetify config current_theme SpotifyNoPremium
spicetify apply
```

#### Windows
In **Powershell**:
```powershell
cd "$(spicetify -c | Split-Path)\Themes"
git clone https://github.com/Daksh777/SpotifyNoPremium
spicetify config current_theme SpotifyNoPremium
spicetify apply
```
### 3. Installing BlockTheSpot (Optional)
Use [BlockTheSpot.bat](https://raw.githubusercontent.com/Daksh777/BlockTheSpot/1e0a272133b88ca44cd5d7523f5b2ce6f59a1fd0/BlockTheSpot.bat) to block Spotify ads and more, source: https://github.com/Daksh777/BlockTheSpot
