#!/usr/bin/env bash

echo "Installing nodejs and common frontend development tools..."

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs

# install npm packages
npm install http-server -g
npm install -g @angular/cli

echo "Node, NPM, jspm, gulp, grunt and bower have been installed"
