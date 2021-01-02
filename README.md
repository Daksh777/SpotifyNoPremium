# What is this?
This is a custom theme that removes the "Upgrade" button from the Spotify client using the Spicetify CLI.

# Screenshot
#### With custom theme
![With](https://i.imgur.com/ffG9TQV.png)

#### Without custom theme
![Without](https://i.imgur.com/dCGxr2W.png)

# Installation
 ### Spicetify CLI
 Installation instructions for Windows, MacOS and Linux can be found [here](https://github.com/khanhas/spicetify-cli/wiki/Installation).
 
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
