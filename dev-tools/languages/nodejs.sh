#!/usr/bin/env bash

echo "Installing nodejs and common frontend development tools..."

sudo apt-get update && sudo apt-get install yarn

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

npm install -g @angular/cli
npm install -g http-server

echo "Node, NPM, Angular, Yarn have been installed"
