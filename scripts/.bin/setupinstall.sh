#!/bin/bash
# Install preferred packages as root and customize environment
# Written by Chad Sebesta

# Check if script is running as root
if [[ $EUID -ne 0 ]]; then 
	echo "This script must be run as root"
	exit 1
fi

# Install desired packages from packages.txt
if [ -f ./packages.txt ]; then
	packages=$(cat ./packages.txt)

	for i in $packages; do
		apt-get install -y $i > /dev/null  2>&1 \
		&& echo "Installed $i successfully" \
		|| echo "Failed to install $i"
	done

else
	echo "Installation failed"
	exit 1

fi
