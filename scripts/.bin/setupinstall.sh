#!/bin/bash
# Install preferred packages as root and customize environment
# Written by Chad Sebesta

SEP='----------'

# Check if script is running as root
if [[ $EUID -ne 0 ]]; then 
	echo "This script must be run as root"
	exit 1
fi

# Update repository
apt-get update

echo $SEP

# Install desired packages from packages.txt
if [ -f ./packages.txt ]; then
	packages=$(cat ./packages.txt)

	for i in $packages; do
		apt-get install -y $i > /dev/null  2>&1 \
		&& echo "Installed $i" \
		|| echo "Failed to install $i"
	done

else
	echo "Installation failed"
	exit 1

fi

echo $SEP

read -p "Please enter your username: "
sudo -u $REPLY

# Change gtk theme
gsettings set org.gnome.desktop.interface gtk-theme 'Numix'
gsettings set org.gnome.desktop.wm.preferences theme 'Numix'

# Change icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Square'
