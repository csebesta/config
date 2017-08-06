#!/bin/bash
# Install preferred packages and customize environment
# Written by Chad Sebesta

SEP='----------'

# Add ppa
read -p "Add ppa? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Numix repository
	sudo add-apt-repository ppa:numix/ppa

	# Update repositories
	echo "Updating repositories..."
	sudo apt-get update > /dev/null 2>&1 \
	&& echo "Update successful" \
	|| echo "Update failed"

fi

echo $SEP

# Update and install packages
read -p "Update and install packages? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Define packages to be installed
	PACKAGES="
	gparted
	graphicsmagick
	htop
	redshift-gtk
	rxvt-unicode
	stow
	suckless-tools
	tilda
	vim
	vlc
	xbindkeys
	xmonad
	"

	# Update repositories
	echo "Updating repositories..."
	sudo apt-get update > /dev/null 2>&1 \
	&& echo "Update successful" \
	|| echo "Update failed"

	# Install packages
	for i in $PACKAGES; do
		echo -n "Installing $i... "
		sudo apt-get install -y $i > /dev/null 2>&1 \
		&& echo "Successful" \
		|| echo "Failed"
	done

fi

echo $SEP

# Create homelab
read -p "Create homelab? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then	

	# Define packages to be installed
	PACKAGES="
	vagrant
	virtualbox
	"

	# Update repositories
	echo "Updating repositories..."
	sudo apt-get update > /dev/null 2>&1 \
	&& echo "Update successful" \
	|| echo "Update failed"

	# Install packages
	for i in $PACKAGES; do
		echo -n "Installing $i... "
		sudo apt-get install -y $i > /dev/null 2>&1 \
		&& echo "Successful" \
		|| echo "Failed"
	done

fi

echo $SEP

# Disable guest account
# https://wiki.ubuntu.com/LightDM
read -p "Disable guest account? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Define file
	FILE='/etc/lightdm/lightdm.conf.d/50-no-guest.conf'

	# Write configuration to file
	echo -e "[Seat:*]\nallow-guest=false" | sudo tee $FILE > /dev/null \
	&& echo "Created... $FILE" \
	|| echo "Failed to create $FILE"

	# Define file
	FILE='/etc/lightdm/lightdm.conf.d/50-hide-users.conf'

	# Write configuration to file
	echo -e "[Seat:*]\ngreeter-hide-users=true" | sudo tee $FILE > /dev/null \
	&& echo "Created... $FILE" \
	|| echo "Failed to create $FILE"

	# Define file
	FILE='/etc/lightdm/lightdm.conf.d/50-manual-login.conf'

	# Write configuration to file
	echo -e "[Seat:*]\ngreeter-show-manual-login=true" | sudo tee $FILE > /dev/null \
	&& echo "Created... $FILE" \
	|| echo "Failed to create $FILE"

fi

echo $SEP

# Adjust gtk settings
read -p "Adjust gtk settings? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Define packages to be installed
	PACKAGES="
	numix-gtk-theme
	numix-icon-theme
	numix-icon-theme-square
	"

	# Update repositories
	echo "Updating repositories..."
	sudo apt-get update > /dev/null 2>&1 \
	&& echo "Update successful" \
	|| echo "Update failed"

	# Install packages
	for i in $PACKAGES; do
		echo -n "Installing $i... "
		sudo apt-get install -y $i > /dev/null 2>&1 \
		&& echo "Successful" \
		|| echo "Failed"
	done

	# Disable overlay scrollbars
	gsettings set com.canonical.desktop.interface scrollbar-mode 'normal'

	# Change gtk theme
	gsettings set org.gnome.desktop.interface gtk-theme 'Numix'
	gsettings set org.gnome.desktop.wm.preferences theme 'Numix'

	# Change icon theme
	gsettings set org.gnome.desktop.interface icon-theme 'Numix-Square'

	# Change lock screen
	gsettings set com.canonical.unity-greeter background-color '#2d2d2d'
	gsettings set com.canonical.unity-greeter draw-grid 'false'

fi
