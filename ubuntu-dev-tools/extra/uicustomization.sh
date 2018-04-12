#!/usr/bin/env bash

echo 'Adding tools and repository for new themes and icons...'

sudo add-apt-repository ppa:numix/ppa &&
sudo apt-get update &&
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle numix-icon-theme-square

echo 'small header bar ...'
tee ~/.config/gtk-3.0/gtk.css <<-EOF
.header-bar.default-decoration {
 padding-top: 3px;
 padding-bottom: 3px;
 font-size: 0.8em;
}

.header-bar.default-decoration .button.titlebutton {
 padding: 0px;
}
EOF

echo 'Is now possible to customize the ubuntu GUI'
