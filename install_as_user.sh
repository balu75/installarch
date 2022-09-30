#!/bin/bash

set -e

# Packages
sudo pacman -S --noconfirm wget \
	unzip \
	virtualbox-guest-utils \
	tmux

# System
sudo systemctl enable vboxservice

# Suckless

mkdir -p ~suckless
cd ~/suckless

[ ! -d "st" ] && git clone git@github.com:balu75/st.git
[ ! -d "bar" ] && git clone git@github.com:balu75/bar.git
[ ! -d "dwm" ] && git clone git@github.com:balu75/dwm.git

# dot-files

cd ~
git clone git@github.com:balu75/dot-files.git
cd ~/dot-files
./setup

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





