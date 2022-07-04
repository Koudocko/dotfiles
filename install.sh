#!/bin/sh

# Install specified pacman packages 
echo INSTALLING PACMAN PACKAGES
PACKAGES=
for package in `cat packages`
do
    if ! pacman -Q $package > /dev/null 2>&1; then
        if pacman -Qg $package > /dev/null 2>&1; then
            choice=N
            read -p "Do you want to install $package group? (y/N): " choice
            if [ "$choice" == "y" ]; then
                echo "[+] Group "$package" added to install..."
                PACKAGES+=" $package"
            fi
        else
            echo "[+] Package "$package" not installed! Adding to install..."
            PACKAGES+=" $package"
        fi
    else
        echo "[.] Package "$package" installed!"
    fi
done
[ ! -z "$PACKAGES" ] && sudo pacman -S $PACKAGES 

# Install configs for packages
echo INSTALLING PACKAGE CONFIGS 
for config in configs/.*
do
    if [ $config != configs/.. ] && [ $config != configs/. ]; then
        sudo cp -r $config ~
    fi
done
echo Installed `ls -r configs/.* | wc -l`  configs successfully!
