#!/usr/bin/env bash

echo "Installing nodejs and common frontend development tools..."

# download nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && \. "$NVM_DIR/nvm.sh"

# set variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


# update .bashrc
cat << 'END' >> ~/.bashrc

# nvm settings:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

END

# install node/npm
nvm install stable

# install npm packages
npm install -g jspm
npm install -g gulp
npm install -g grunt-cli
npm install -g bower
npm install -g phantomjs

echo "Node, NPM, jspm, gulp, grunt, phantomjs and bower have been installed"
