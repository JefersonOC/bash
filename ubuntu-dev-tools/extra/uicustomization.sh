#!/usr/bin/env bash

echo 'Adding tools and repository for new themes and icons...'

sudo add-apt-repository ppa:numix/ppa &&
sudo apt-get update &&
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle numix-icon-theme-square

echo 'Is now possible to customize the ubuntu GUI'
