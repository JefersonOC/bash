wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" && 
sudo dpkg -i google-chrome-stable_current_amd64.deb && 
sudo apt-get install -y -f && 
sudo rm google-chrome-stable_current_amd64.deb && 
sudo apt install ttf-mscorefonts-installer && 
sudo snap install htop && 
sudo apt install httpie && 
sudo snap install insomnia && 
sudo snap install gitkraken && 
sudo snap install heroku --classic && 
sudo apt install maven && 
wget https://download.virtualbox.org/virtualbox/6.0.16/VirtualBox-6.0.16-135674-Linux_amd64.run -O virtualbox.run &&
chmod +x virtualbox.run &&
sudo ./virtualbox.run
