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
if ! [ -z "$PACKAGES" ] 
then
	sudo pacman -S $PACKAGES
fi

# Install configs for packages
for config in *
do
	if [ $config != install.sh ] && [ $config != packages ]  
	then
		sudo mkdir -p ~/.config/$config
		sudo cp -r $config/* ~/.config/$config/
		echo Installed $config config
	fi
done
