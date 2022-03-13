# SpotifyNoPremium
A cross-platform Spicetify theme which declutters Spotify stock UI and removes all ads.

---
We've switched to a cross-platform ad-blocking solution so make sure to use the latest `install.bat` to get the latest features

---

##### If you just updated to `1.1.80.699.gc3dac750`, please follow these instructions for a fix: [#46 (comment)](https://github.com/Daksh777/SpotifyNoPremium/issues/46#issuecomment-1059945231)
##### Last tested version: `1.1.80.699.gc3dac750`

# Features
This is a Spicetify theme which:
- Removes all Spotify ads ([Source](https://github.com/CharlieS1103/spicetify-extensions/blob/main/adblock/adblock.js))
- Removes `Upgrade` button
- Removes `Upgrade to Premium` entry in drop-down menu
- Removes ad placeholders (in Home tab and above the now playing bar)
- Adds pointer cursors to clickable elements (See [#10](https://github.com/Daksh777/SpotifyNoPremium/discussions/10))

> **Note for users who install this manually:** Make sure to use the latest Spicetify CLI and Spotify App. Run `spicetify upgrade` and then `spicetify backup apply` to update Spicetify to the latest version.

# Screenshots

| Before | After |
| ----------- | ----------- |
| <img src="https://i.imgur.com/VAtMBYx.jpg"/> | <img src="https://i.imgur.com/g0heSZm.jpg"/> |
| <img src="https://i.imgur.com/to8dzhO.jpg"/> | <img src="https://i.imgur.com/JDj5rvQ.jpg"/> |

# Installation

## 1. Automatic installation/updates for Windows users
##### **Note: If you're on Windows 8.1 or lower, please install Powershell v5.1 since the automatic installation script does not support Powershell versions below v5. <br> Download here: https://www.microsoft.com/en-us/download/details.aspx?id=54616 <br> More info: [#30](https://github.com/Daksh777/SpotifyNoPremium/issues/30#issuecomment-962822618)**
### Installation
Run the `install.bat` if you are installing for the the first time. <br>
[[CLICK HERE TO DOWNLOAD]](https://raw.githack.com/Daksh777/SpotifyNoPremium/main/install.bat) <br>


### Updating
You can fetch the latest version of this theme by running the `update.bat` script <br>
[[CLICK HERE TO DOWNLOAD]](https://raw.githack.com/Daksh777/SpotifyNoPremium/main/update.bat)


## 2. Manual installation for all users
### Linux and MacOS:
In **Bash**:
```bash
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
cd "$(dirname "$(spicetify -c)")/Themes"
git clone https://github.com/Daksh777/SpotifyNoPremium
spicetify config current_theme SpotifyNoPremium
cp "$(dirname "$(spicetify -c)")/Themes/SpotifyNoPremium/adblock.js" "$(dirname "$(spicetify -c)")/Extensions"
spicetify config extensions adblock.js
spicetify apply
```

#### Windows
In **Powershell**:
```powershell
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1" | Invoke-Expression
cd "$(spicetify -c | Split-Path)\Themes"
git clone https://github.com/Daksh777/SpotifyNoPremium
spicetify config current_theme SpotifyNoPremium
Copy-Item "$(spicetify -c | Split-Path)\Themes\SpotifyNoPremium\adblock.js" "$(spicetify -c | Split-Path)\Extensions"
spicetify config extensions adblock.js
spicetify apply
```
