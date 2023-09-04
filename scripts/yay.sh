#!/bin/sh

! pacman -Q yay > /dev/null 2>&1 && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && sudo rm ../yay -r 


if pacman -Q yay > /dev/null 2>&1; then
	list="vim-plug ani-cli osu-lazer-bin anki-bin"
	packages=

	for package in $list
	do
		if ! pacman -Q $package > /dev/null 2>&1; then
			packages+=" $package"
		fi
	done

	yay -S $packages 
fi
