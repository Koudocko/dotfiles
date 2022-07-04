#!/bin/sh

# Install specified pacman packages 
echo ======INSTALLING PACMAN PACKAGES=====
PACKAGES=
for package in `cat pac_packages`
do
    if ! pacman -Q $package > /dev/null 2>&1; then
        if pacman -Qg $package > /dev/null 2>&1; then
            read -p "Do you want to install $package group? (y/N): " choice || choice=N
            if [ "$choice" == "y" ]; then
                echo "[+] Group ($package) added to install..."
                PACKAGES+=" $package"
            fi
        else
            echo "[+] Package ($package) not installed! Adding to install..."
            PACKAGES+=" $package"
        fi
    else
        echo "[.] Package ($package) already installed!"
    fi
done
[ ! -z "$PACKAGES" ] && sudo pacman -S $PACKAGES 
PACKAGES=

# Install yay package
read -p "Do you want to install AUR packages? (y/N)" choice || choice=N
if [ "$choice" == "y" ]; then
	echo =====INSTALLING AUR PACKAGES=====
	! pacman -Q yay > /dev/null 2>&1 && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..

	for package in `cat aur_packages`
	do
	    if ! pacman -Qm $package > /dev/null 2>&1; then
			echo "[+] Package ($package) not installed! Adding to install..."
            PACKAGES+=" $package"
		else
			echo "[.] Package ($package) already installed!"
		fi
	done
	[ ! -z "$PACKAGES" ] && yay -S $PACKAGES
fi

# Install configs for packages
echo =====INSTALLING PACKAGE CONFIGS======
for config in configs/.*
do
    if [ $config != configs/.. ] && [ $config != configs/. ]; then
		echo "[*] Config ($config) installed!"
        sudo cp -r $config ~
    fi
done
echo Installed `ls configs/.* -a | wc -l`  configs successfully!

# Miscellaneous config tweaks 
echo =====FINALIZING CONFIG=====
pacman -Qm vim-plug > /dev/null 2>&1 && vim +'PlugInstall --sync' +qa
sudo systemctl enable NetworkManager; sudo systemctl enable sshd; sudo systemctl enable systemd-timesyncd
