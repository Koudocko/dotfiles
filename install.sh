#!/bin/sh

# Install specified packages 
PACKAGES=
for package in `cat packages` 
do
	if ! pacman -Q $package > /dev/null 2>&1
	then
		echo "Package \"$package\" not installed! Adding to install..."
		PACKAGES+=" $package"	
	fi
done
sudo pacman -S $PACKAGES 2> /dev/null

# Install configs for packages
for config in configs/.*
do
	if [ $config != configs/.. ] && [ $config != configs/. ] 
	then
		sudo cp -r $config ~
	fi
done
echo Installed `ls -r configs/.* | wc -l ` configs successfully!
