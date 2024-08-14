#!/usr/bin/env bash

echo "Installing and configuring Python 3..."
sudo apt install python3 && 
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev pkg-config wget && 
sudo pip3 install --upgrade pip
