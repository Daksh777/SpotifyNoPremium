# What is this?
This is a custom theme which removes the "Premium" button from Spotify using spicetify-cli

# Screenshot
![Screenshot](https://i.imgur.com/ffG9TQV.png)

# Installation
 ### Spicetify CLI
 Installation instructions for Windows, MacOS and Linux can be found [here](https://github.com/khanhas/spicetify-cli/wiki/Installation)
 
 ### Installing Theme
 
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
