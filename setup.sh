#!/bin/bash
# Home directory configuration script
# Written by Chad Sebesta

SEP='----------'

# Cleanup broken symlinks in the home directory
# Not doing this may lead to conflicts while using stow
# Check number of broken symlinks
symlinkn=$(find -L $HOME -type l | wc -l)
echo "There are $symlinkn broken symlinks"

# Confirm action
read -p "Delete these broken symlinks? "
if [[ $REPLY =~ ^[Yy]$ ]] && [[ $symlinkn -ne 0 ]]; then
	find -L $HOME -type l -print -delete
else
	echo "No symlinks deleted"
fi

echo $SEP

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
	&& echo "Stowed $d successfully" \
	|| echo "Failed to stow $d"

done
