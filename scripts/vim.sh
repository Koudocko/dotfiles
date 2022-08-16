#!/bin/sh

pacman -Qm vim-plug > /dev/null 2>&1 && vim +'PlugInstall --sync' +qa && vim +'CocInstall coc-rust-analyzer coc-pairs coc-json coc-clangd'
