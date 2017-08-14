#!/bin/bash
# Install preferred packages and customize environment
# Written by Chad Sebesta

SEP='----------'

# Update repositories
echo "Updating repositories..."
sudo apt-get update > /dev/null 2>&1 \
&& echo "Update successful" \
|| { echo "Update failed"; exit 1; }

echo $SEP

# Add ppa repositories
read -p "Add ppa repositories? (y/n) "
if [[ $REPLY =~ ^[Yy]$ ]]; then

	# Define repositories to be added
	REPOSITORIES="
	numix/ppa
	"

	# Add repositories
	for i in $REPOSITORIES; do
		echo -n "Adding $i... "
		sudo add-apt-repository -y ppa:$i > /dev/null 2>&1 \
		&& echo "Successful" \
		|| echo "Failed"
	done


	# Update repositories
	echo -n "Updating repositories... "
	sudo apt-get update > /dev/null 2>&1 \
	&& echo "Successful" \
	|| echo "Failed"

fi

echo $SEP

# Install packages
read -p "Install packages? (y/n) "
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
	ttf-dejavu
	vim
	vlc
	xbindkeys
	xmonad
	"

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
	gsettings set com.canonical.unity-greeter draw-user-backgrounds 'false'
	gsettings set com.canonical.unity-greeter draw-grid 'false'

fi
