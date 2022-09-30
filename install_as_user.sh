#!/bin/bash

set -e

# Packages
sudo pacman -S --noconfirm wget unzip

# Fonts
mkdir -pv ~/tmp-inconsolata
cd ~/tmp-inconsolata

rm -rfv *
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Inconsolata.zip
unzip Inconsolata.zip 
mkdir -pv ~/.local/share/fonts
mv -v *.ttf ~/.local/share/fonts

cd ~
rm -rfv ~/tmp-inconsolata





