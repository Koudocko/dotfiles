# dotfiles

**How to Install:**
1. Download the [alps](https://github.com/Koudocko/alps) configuration manager 
2. Clone this repo into ~/.config/alps
3. Run "alps -Sg dotfiles"

**Dual Configuration:**
I two system GUI configurations present.  

<h1 align="center"> <img src="examples/WaylandExample.png" alt="Wayland"></h1>
1. Hyprland (Wayland)  
- Boot is available on tty1.  
- wofi (application launcher)  
- waybar (status bar)  
- hyprpaper (wallpaper utility)  
- grim + swappy (screenshot utility)  
TLDR: Provides a clean and fluid experience.  

<h1 align="center"> <img src="examples/X11Example.png" alt="X11"></h1>
2. i3 (X11)  
- Boot is available on tty2  
- rofi (application launcher)  
- i3status (status bar)  
- feh (wallpaper utility)  
- flameshot (screenshot utility)  
TlDR: Provides a minimal and functional experience.  

**Other Notable Features:**
The Fcitx IMF is enabled and shipped with the Mozc IME. Ctrl + Space to toggle between en_US and ja_JP.  
EasyEffects is enabled, but the profile is not loaded. The Linux-Solid profile is available to enhance audio quality.  

**General Use Guide:**
*These keybinds are standard across both Wayland and X11 sessions.  

<Alt + Enter> => Open Alacritty terminal emulator  
<Alt + d> => Open corresponding application launcher  
<Alt + w, W> => Open firefox or chromium respectively  
<Alt + 1-9,0> => Open numbered workspace  
<Alt + h, j, k, l> => Move focus left, down, up, and right respectively  
<Alt + H, J, K, L> => Move window left, down, up, and right respectively  
<Alt + q> => Close active window  
<Win + S> => Open screenshot utility  
<Alt + n> => Toggle status bar  

*For a complete set of keybinds, please see the corresponding configuration file for the application...*  

**WARNING:** These dotfiles are designed for a clean system install. Meaning some root files will be edited  
If you wish to remove these entries, run:

```
alps -Eg dotfiles
```

Delete the following entries under the label "[CONFIGS]":
- /etc/xdg/reflector/reflector.conf_1
- /etc/nsswitch.conf_1
- /etc/pacman.conf_1
- /etc/environment_1
- /etc/locale.conf
- /etc/locale.gen
- /etc/issue
