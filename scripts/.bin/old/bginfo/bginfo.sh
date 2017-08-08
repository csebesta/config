#!/bin/bash
# Start this script on system boot or login
# Color pallete: https://design.ubuntu.com/brand/colour-palette
# Candidate colors: 2C001E 333333 2D2D2D
# Text colors: FFFFFF F9F9F9(with 2D2D2D) DEDEDE DCDCDC

# Get screen resolution
RESOLUTION="$(xdpyinfo | awk '/dimensions/{print $2}')"
echo $RESOLUTION

# Get system information
echo $USER
echo $HOSTNAME

# Create background with solid color
# http://askubuntu.com/questions/66914/how-to-change-desktop-background-from-command-line-in-unity
# Use if command described in link above for backwards compatibility
#convert -size $RESOLUTION xc:#2C001E /tmp/bginfo.png
#convert -size $RESOLUTION xc:#2D2D2D /tmp/bginfo.jpg
convert -size $RESOLUTION xc:#2D2D2D \
	-gravity center -font consola.ttf -pointsize 16 \
	label:TEST
	label:THIS
	/tmp/bginfo.jpg

# Set image as background
gsettings set org.gnome.desktop.background \
picture-uri file:///tmp/bginfo.jpg
