#!/bin/sh


! pacman -Q yay > /dev/null 2>&1 && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && rm ../yay -r 

if pacman -Q yay > /dev/null 2>&1; then
	list="vim-plug phinger-cursors icons-in-terminal"
	packages=

	for package in $list
	do
		if ! pacman -Q $package > /dev/null 2>&1; then
			packages+=" $package"
		fi
	done

	yay -S $packages 
fi