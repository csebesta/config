#!/bin/bash
# Install preferred packages as root and customize environment
# Written by Chad Sebesta

SEP='----------'

# Add ppa repositories
sudo add-apt-repository ppa:numix/ppa

echo $SEP

# Update and install packages
sudo apt-get update
sudo apt-get install numix-gtk-theme

echo $SEP

# Change gtk theme
gsettings set org.gnome.desktop.interface gtk-theme 'Numix'
gsettings set org.gnome.desktop.wm.preferences theme 'Numix'

# Change icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Square'
