echo "** UP YOUR SYSTEM ** " &&
flatpak update && 
sudo apt-get update &&
sudo apt-get -y upgrade &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean &&
sudo shutdown -h 23:00
