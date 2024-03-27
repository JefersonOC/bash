echo "** UP YOUR SYSTEM ** " &&
flatpak update && 
sudo apt update &&
sudo apt -y upgrade &&
sudo apt -f install &&
sudo apt autoremove &&
sudo apt -y autoclean &&
sudo apt -y clean
