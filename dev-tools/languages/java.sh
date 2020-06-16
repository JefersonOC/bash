#!/usr/bin/env bash

echo "Installing and configuring Java 11..."
sudo apt purge openjdk* &&
sudo apt install openjdk-11-jdk