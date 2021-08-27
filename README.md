## ⚠ Please re-run the updated [install.bat](https://gitcdn.link/repo/Daksh777/SpotifyNoPremium/main/install.bat) or [update.bat](https://gitcdn.link/repo/Daksh777/SpotifyNoPremium/main/update.bat) script if you are getting a blank screen in Spotify after applying the theme. Also, have a look at [#13](https://github.com/Daksh777/SpotifyNoPremium/issues/13#issuecomment-891503806) for more information.
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

## 1. Automatic installation/updates for Windows users
### Installation
Run the `install.bat` script which installs [**Git**](https://git-scm.com/download/win) + [**Spicetify CLI**](https://github.com/khanhas/spicetify-cli) + **the theme** + [**BlockTheSpot**](https://github.com/Daksh777/BlockTheSpot) (to block all Spotify ads, optional): <br>
[[CLICK HERE TO DOWNLOAD]](https://gitcdn.link/repo/Daksh777/SpotifyNoPremium/main/install.bat) <br>

> Note: Git and Spicetify CLI are required for the theme to be installed. However, their installations are skippable if already installed so the script will only install the theme.

### Updating
You can fetch the latest version of this theme by running the `update.bat` script: <br>
[[CLICK HERE TO DOWNLOAD]](https://gitcdn.link/repo/Daksh777/SpotifyNoPremium/main/update.bat)

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
### 3. Installing BlockTheSpot (Optional, Windows only)
Use `SpotifyNoPremium.ps1` to block Spotify ads and more, source: https://github.com/Daksh777/BlockTheSpot <br>
[[CLICK HERE TO DOWNLOAD]](https://gitcdn.link/repo/Daksh777/BlockTheSpot/master/SpotifyNoPremium.ps1)
