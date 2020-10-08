#!/usr/bin/env bash

echo "Installing and configuring Python 3..."
sudo apt-get -y install unzip python3-pip python3-dev build-essential libssl-dev libffi-dev xvfb && 
sudo pip3 install --upgrade pip
