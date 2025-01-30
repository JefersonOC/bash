#!/bin/bash
sudo apt-get update &&
sudo apt-get upgrade &&
sudo apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++ -y &&
sudo apt-get install git -y &&
git clone https://github.com/tpruvot/cpuminer-multi &&
cd cpuminer-multi &&
sudo ./build.sh
./cpuminer -o stratum+tcp://br.stratum.braiins.com:3333 -u blackfishlabs.NOTEBOOK -p x -a sha256d
