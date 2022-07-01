#!/bin/sh

# Install specified packages 
for package in `cat packages` 
do
	if ! pacman -Q $package > /dev/null 2>&1
	then
		echo "Package \"$package\" not installed! Prompting for install..."
		sudo pacman -S $package
	fi
done

# Install configs for packages
for config in *
do
	if [ $config == install.sh ]
	then 
		continue
	else
		echo "Installing $config config..."
		cp -r $config ~/.config
		echo "Done installing $config config!"
	fi
done
