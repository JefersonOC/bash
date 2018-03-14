#!/usr/bin/env bash

echo 'Adding tools and repository for new themes and icons...'
add-apt-repository -y ppa:noobslab/themes
add-apt-repository -y ppa:noobslab/icons
apt-get update
apt-get install -y compizconfig-settings-manager \
                   compiz-plugins \
                   myelementary
cd ~ && git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
./autogen.sh --prefix=/usr
make install
rm -rf ~/arc-theme
echo 'Is now possible to customize the ubuntu GUI'
