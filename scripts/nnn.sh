#!/bin/sh

git clone https://github.com/Koudocko/nnn.git && cd nnn && make O_ICONS=1 && sudo cp nnn /usr/local/bin/ && cd .. && sudo rm -r nnn 
