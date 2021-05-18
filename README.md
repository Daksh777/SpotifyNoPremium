# What is this?
This is a custom theme that removes the "Upgrade" button and the placeholder for ads from the Spotify client using the Spicetify CLI. <br>
Supports both old and new UI


# Installation
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