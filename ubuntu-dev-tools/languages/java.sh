#!/usr/bin/env bash

echo "Installing and configuring Java 8..."
sudo add-apt-repository ppa:webupd8team/java &&
sudo apt-get update
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default
