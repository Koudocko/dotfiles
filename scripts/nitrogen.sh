#!/bin/sh

mkdir ~/.config/nitrogen/ -p
touch ~/.config/nitrogen/nitrogen.cfg 
touch ~/.config/nitrogen/bg-saved.cfg

echo "[geometry]
posx=9
posy=48
sizex=1900
sizey=1021

[nitrogen]
view=icon
recurse=true
sort=alpha
icon_caps=false
dirs=$HOME/Pictures/Wallpapers;" > "$HOME/.config/nitrogen/nitrogen.cfg"

echo "[xin_-1]
file=$HOME/Pictures/Wallpapers/ZeldaWallpaper0.jpg
mode=0
bgcolor=#000000" > "$HOME/.config/nitrogen/bg-saved.cfg"
