#!/usr/bin/env bash

echo "Installing and configuring Java 8..."
sudo sudo add-apt-repository ppa:linuxuprising/java &&
sudo apt-get update &&
sudo apt-get install -y oracle-java12-installer oracle-java12-set-default
