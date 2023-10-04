#!/bin/sh

sudo systemctl enable NetworkManager.service
sudo systemctl enable systemd-timesyncd.service
sudo systemctl enable ufw.service
sudo systemctl enable cups.service
sudo systemctl enable avahi-daemon.service

sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer
sudo systemctl enable reflector.timer
