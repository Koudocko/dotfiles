#!/bin/sh

# Install specified pacman packages 
echo _____INSTALLING PACMAN PACKAGES_____
PACKAGES=
for package in `cat packages` 
do
	if ! ((pacman -Q $package > /dev/null 2>&1) || (pacman -Qg $package > /dev/null 2>&1))
	then
		echo "[+] Package \"$package\" not installed! Adding to install..."
		PACKAGES+=" $package"	
	else
		echo "[.] Package \"$package\" installed!"
	fi
done
sudo pacman -S $PACKAGES 2> /dev/null

# Install yay package 
echo _____INSTALLING YAY PACKAGE_____
if ! pacman -Q yay > /dev/null 2>&1
then
	echo "[+] Package \"yay\" not installed! Adding to install..."
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si
else
	echo "[.] Package \"yay\" installed!"
fi

# Install configs for packages
echo _____INSTALLING PACKAGE CONFIGS_____ 
for config in configs/.*
do
	if [ $config != configs/.. ] && [ $config != configs/. ] 
	then
		sudo cp -r $config ~
	fi
done
echo Installed `ls -r configs/.* | wc -l ` configs successfully!

echo ==========================
echo VIDEO DRIVERS NOT INCLUDED 
echo ==========================
