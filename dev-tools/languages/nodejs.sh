#!/usr/bin/env bash

echo "Installing nodejs and common frontend development tools..."

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs

npm install -g @angular/cli

echo "Node, NPM, Angular, Yarn have been installed"
