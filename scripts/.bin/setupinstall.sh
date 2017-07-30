#!/bin/bash
# Install preferred packages as root
# Written by Chad Sebesta

# Check if running as root
#if [[ $EUID -ne 0 ]]; then 
#	echo "This script must be run as root"
#	exit 1
#fi

# Install desired packages from packages.txt
packages=$(cat ./packages.txt)
for i in $packages; do
	apt-get install -y $i > /dev/null  2>&1 \
	&& echo "Installed $i successfully" \
	|| echo "Failed to install $i"
done
