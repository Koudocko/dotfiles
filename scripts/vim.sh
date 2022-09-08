#!/bin/sh

pacman -Qm vim-plug > /dev/null 2>&1 && vim +'PlugInstall --sync' +qa && vim +'CocInstall -sync coc-rust-analyzer coc-pairs coc-json coc-clangd coc-java' +qall
