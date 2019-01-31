#!/usr/bin/env bash

sudo apt install ttf-mscorefonts-installer && 
sudo snap install slack --classic && 
sudo snap install skype --classic && 
sudo snap install htop && 
sudo snap install postman && 
sudo snap install gitkraken && 
sudo snap install heroku --classic && 
sudo snap install obs-studio && 
sudo snap install 0ad && 
wget https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0.4-128413-Linux_amd64.run -O virtualbox.run &&
chmod +x virtualbox.run &&
sudo ./virtualbox.run
