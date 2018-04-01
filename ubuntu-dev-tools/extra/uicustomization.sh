#!/usr/bin/env bash

echo 'Adding tools and repository for new themes and icons...'
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo apt-get update
sudo apt-get install -y compizconfig-settings-manager \
                   compiz-plugins \
                   myelementary
cd ~ && git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
./autogen.sh --prefix=/usr
make install
rm -rf ~/arc-theme

sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle

echo 'Is now possible to customize the ubuntu GUI'
