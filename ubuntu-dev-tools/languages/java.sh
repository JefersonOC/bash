#!/usr/bin/env bash

echo "Installing and configuring Java 10..."
sudo add-apt-repository ppa:linuxuprising/java &&
sudo apt-get update &&
sudo apt-get install -y oracle-java10-installer oracle-java10-set-default
