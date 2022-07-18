# dotfiles

## How to Install:
1. Move the config-install script to /usr/local/bin 
2. Set the environment variable DOTDIR to the dotfiles path
2. Run config-install {user} 
3. All scripts, configs, and programs in the dotfiles directory will be installed 

## How to configure
- The dotfiles/configs directory represents your ~ or /home/{user} directory 
- All folders and files placed in here will be installed to your ~ or /home/{user} directory 
- The scripts folder is a list of executables which are install to your /usr/local/bin directory 
- The pac_packages file is a list of space seperated pacman packages to be installed to your system 
- The aur_packages file is a list of space seperates AUR packages to be installed to your system 
