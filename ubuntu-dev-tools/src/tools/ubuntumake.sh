#!/usr/bin/env bash

echo "Installing Ubuntu Make..."

sudo add-apt-repository -y ppa:lyzardking/ubuntu-make &&
sudo apt-get update &&
sudo apt-get install ubuntu-make

echo "Ubuntu Make is done!"