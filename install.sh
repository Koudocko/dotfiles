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
for config in `ls -a configs/` 
do
    if [ $config != .. ] && [ $config != . ]; then
		sudo cp -r configs/$config ~ && echo "[*] Config ($config) updated!"
		sudo chown -R $USER ~/$config
    fi
done
echo Installed `ls configs/.* -a | wc -l`  configs successfully!

# Install custom scripts
echo =====INSTALLING CUSTOM SCRIPTS=====
for script in `ls scripts/`
do
	sudo cp scripts/$script /usr/local/bin && echo "[*] Script ($script) updated!"
done

# Miscellaneous config tweaks 
echo =====FINALIZING CONFIG=====
pacman -Qm vim-plug > /dev/null 2>&1 && vim +'PlugInstall --sync' +qa
sudo systemctl enable NetworkManager; sudo systemctl enable sshd; sudo systemctl enable systemd-timesyncd
