wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" && 
sudo dpkg -i google-chrome-stable_current_amd64.deb && 
sudo apt-get install -y -f && 
sudo rm google-chrome-stable_current_amd64.deb && 
sudo apt install ttf-mscorefonts-installer && 
flatpak install flathub com.axosoft.GitKraken && 
flatpak install flathub com.getpostman.Postman
