#!/bin/sh

pacman -Q rustup > /dev/null 2>&1 && rustup default stable
