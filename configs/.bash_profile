#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec Hyprland
[[ $(fgconsole 2>/dev/null) == 2 ]] && exec startx -- vt2
