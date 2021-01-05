# What is this?
This is a custom theme that removes the "Upgrade" button from the Spotify client using the Spicetify CLI.

# Screenshot
#### With custom theme
![With](https://i.imgur.com/ffG9TQV.png)

#### Without custom theme
![Without](https://i.imgur.com/dCGxr2W.png)

# Installation
 ## Option 1:
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
Use [BlockTheSpot.bat](https://raw.githubusercontent.com/Daksh777/BlockTheSpot/1e0a272133b88ca44cd5d7523f5b2ce6f59a1fd0/BlockTheSpot.bat) to block Spotify ads and more, source: https://github.com/mrpond/BlockTheSpot

## Option 2:
Use [BlockTheSpot.bat (new)](https://raw.githubusercontent.com/Daksh777/BlockTheSpot/master/BlockTheSpot.bat) with the functionality to remove the "Upgrade button".
