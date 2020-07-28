sudo apt install -y gimp &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh)" &&
flatpak install flathub org.blender.Blender && 
flatpak install flathub org.inkscape.Inkscape &&
flatpak install flathub org.mypaint.MyPaint
