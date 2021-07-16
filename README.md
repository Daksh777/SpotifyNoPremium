## ⚠ Please have a look at [#13](https://github.com/Daksh777/SpotifyNoPremium/issues/13#issuecomment-881127907) if you are getting a blank screen in Spotify after applying the theme for a workaround.
# Features
This is a Spicetify theme which:
- [Removes](https://github.com/Daksh777/BlockTheSpot) all Spotify ads (Windows only, optional)
- Removes `Upgrade` button
- Removes `Upgrade to Premium` entry in drop-down menu
- Removes ad placeholders (in Home tab and above the now playing bar)
- Adds pointer cursors to clickable elements (See [#10](https://github.com/Daksh777/SpotifyNoPremium/discussions/10))

> Note: Make sure to use the latest Spicetify CLI and Spotify App. Run `spicetify upgrade` and then `spicetify backup apply` to update Spicetify to the latest version.

# Screenshots

| Before | After |
| ----------- | ----------- |
| <img src="https://i.imgur.com/VAtMBYx.jpg"/> | <img src="https://i.imgur.com/g0heSZm.jpg"/> |
| <img src="https://i.imgur.com/to8dzhO.jpg"/> | <img src="https://i.imgur.com/JDj5rvQ.jpg"/> |

# Installation

## 1. Automatic installation for Windows users
- Run the [full install script](https://raw.githubusercontent.com/Daksh777/SpotifyNoPremium/main/full-install.ps1) which installs **Git** + **Spicetify CLI** (both can be cancelled if already installed) + **the theme** + [**BlockTheSpot**](https://github.com/Daksh777/BlockTheSpot) (to block all Spotify ads). <br> <br>
OR <br> <br>
- Run [theme only install script](https://raw.githubusercontent.com/Daksh777/SpotifyNoPremium/main/theme-install.ps1) which installs only **Spicetify CLI** (can be cancelled if already installed) + **the theme** + [**BlockTheSpot**](https://github.com/Daksh777/BlockTheSpot) (to block all Spotify ads).

### Updating
You can fetch the latest version of this theme by running [update script](https://raw.githubusercontent.com/Daksh777/SpotifyNoPremium/main/update.ps1)

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
