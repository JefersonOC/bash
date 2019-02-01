sudo apt install -y gimp &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh)" &&
flatpak install flathub org.mypaint.MyPaint &&
flatpak install flathub org.kde.krita &&
sudo snap install blender --classic && 
sudo snap install inkscape
