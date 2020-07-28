#!/usr/bin/env bash

echo "Installing core development libraries (a lot of stuff :P)..."
sudo apt-get update &&
sudo apt-get -y upgrade &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean &&
sudo apt-get install -y make \
                    build-essential \
                    software-properties-common \
                    libssl-dev \
                    libffi-dev \
                    zlib1g-dev \
                    libbz2-dev \
                    libreadline-dev \
                    libsqlite3-dev \
                    llvm \
                    libncurses5-dev \
                    libncursesw5-dev \
                    unixodbc \
                    unixodbc-dev \
                    libaio1 \
                    freetds-bin \
                    freetds-dev \
                    tdsodbc \
                    alien \
                    apt-transport-https \
                    ca-certificates \
                    git \
                    automake \
                    autoconf \
                    pkg-config \
                    libgtk-3-dev \
                    libtiff5-dev \
                    libjpeg8-dev \
                    zlib1g-dev \
                    libfreetype6-dev \
                    liblcms2-dev \
                    libwebp-dev \
                    vim \
                    curl \
                    nano \
                    members \
                    exfat-utils \
                    exfat-fuse \
                    unrar \
                    net-tools \
                    p7zip-full \
                    clipit \
                    zsh

# enable syntax highlighting for all the available languages
find /usr/share/nano/ -iname "*.nanorc" -exec echo include {} \; >> ~/.nanorc

echo "A lot of libraries have been installed for you :)"
