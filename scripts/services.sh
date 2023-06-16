#!/bin/sh

sudo systemctl enable NetworkManager
sudo systemctl enable sshd
sudo systemctl enable systemd-timesyncd

sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer
sudo systemctl enable reflector.timer
