#!/bin/bash
# Home directory configuration script
# Written by

# Install packages from packages.txt
#for i in packages.txt
#	apt-get install -y
#	echo "... Installed succesfully"

# Resolve naming conflicts by moving existing files to an archive directory

# Install configuration files using stow
#for f in $(find dircolors -type f); do
#	echo "$HOME/${f#*/}"
#done

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
			echo "Deleting $i"
		fi
		#echo $i
	done

	# Stow the contents of the directory
	stow $d > /dev/null 2>&1

done

#stow bash
#	#for i in $files; do
	#	echo "$HOME/${i#*/}"
	#done
	#echo $files
	#if [ -e $d* ]; then
	#	echo "ok"
	#fi
	#stow $d
