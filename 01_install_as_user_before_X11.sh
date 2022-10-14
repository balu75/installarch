#!/bin/bash

# Packages
sudo pacman -S --noconfirm \
	wget \
	unzip \
	virtualbox-guest-utils \
	tmux \
	keychain \
	pass \
	neovim \
	chromium \
	openssh \
	stow \
	dmenu \
	python3 \
	python-pip \
	xclip
	
python3 -m pip install --user --upgrade pynvim

# System
sudo systemctl enable vboxservice
sudo systemctl start vboxservice

[ ! -f ~/.ssh/id_ed25519.pub ] && ssh-keygen -t ed25519 -C "thomas.gies@gmx.de"

# Suckless

mkdir -p ~/suckless
cd ~/suckless

[ ! -d st ] && git clone https://github.com/balu75/st.git
[ ! -d bar ] && git clone https://github.com/balu75/bar.git
[ ! -d dwm ] && git clone https://github.com/balu75/dwm.git

cd dwm
make
sudo make install

cd ../bar
make

cd ../st
make
sudo make install

# dot-files
cd ~
git clone https://github.com/balu75/dot-files.git
cd ~/dot-files
./setup

# nvim Konfiguration
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/balu75/nvimconfig.git nvim

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
