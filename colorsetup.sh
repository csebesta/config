#!/bin/bash
# Home directory configuration script
# Written by Chad Sebesta

RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m'

# Install packages from packages.txt
#for i in packages.txt
#	apt-get install -y
#	echo "... Installed succesfully"

# For every directory in the stow directory...
for d in */; do

	# Unstow directory before completing operations
	# This prevents the script from deleting the contents of the stow directory
	stow -D $d > /dev/null 2>&1

	# For every file within the program directory...
	# Delete the target file interactively if it already exists
	for f in $(find $d -type f); do
		i="$HOME/${f#*/}"
		if [ -f $i ]; then
			rm -rfi $i
		fi
	done

	# Stow the contents of the directory
	stow $d > /dev/null 2>&1 \
	&& printf "[  ${GRN}ok${NC}  ]  Stowed $d successfully \n" \
	|| printf "[  ${RED}no${NC}  ]  Failed to stow $d \n"

done
