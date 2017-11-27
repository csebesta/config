# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Set PATH to include scripts
PATH="$HOME/.bin:$HOME/.local/.bin:$PATH"

# Set PATH to include blender release
if [ -d "$HOME/.blender/blender-2.79-linux-glibc219-x86_64" ]; then
	PATH="$HOME/.blender/blender-2.79-linux-glibc219-x86_64:$PATH"
fi

# Execute backinfo script
backinfo.numix

# Set background to backinfo if desktop environment is xmonad
if [ "$DESKTOP_SESSION" = "xmonad" ]; then
	# Check if fehbg file exists
	if [ -f "$HOME/.fehbg" ]; then
		. "$HOME/.fehbg"
	elif [ -f /tmp/backinfo.png ]; then
		feh --bg-center /tmp/backinfo.png
	fi
fi
