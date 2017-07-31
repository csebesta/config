#!/bin/bash
# Home directory configuration script
# Written by Chad Sebesta


# Cleanup broken symlinks in the home directory
# Not doing this may lead to conflicts while using stow
echo "There are $(find -L $HOME -type l | wc -l) broken symlinks"
read -p "Delete these broken symlinks? "
if [[ $REPLY =~ ^[Yy]$ ]]; then
	find -L $HOME -type l -print -delete
else
	echo "No symlinks deleted"
fi

echo "----------"

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
