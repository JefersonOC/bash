#!/usr/bin/env bash

echo "Installing core development libraries (a lot of stuff :P)..."
sudo apt install flatpak && 
flatpak install flathub com.google.Chrome && 
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
                    unrar \
                    net-tools \
                    p7zip-full \
                    zsh \
                    snapd \
                    tilix \
                    ffmpeg

# enable syntax highlighting for all the available languages
find /usr/share/nano/ -iname "*.nanorc" -exec echo include {} \; >> ~/.nanorc

echo "A lot of libraries have been installed for you :)"
