#!/bin/bash
# Home directory configuration script
# Written by

# Install packages from packages.txt
#for i in packages.txt
#	apt-get install -y
#	echo "... Installed succesfully"

# Resolve naming conflicts by moving existing files to an archive directory

# Install configuration files using stow
stow bash
