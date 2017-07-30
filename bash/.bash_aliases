#!/bin/bash
# ~/.bash_aliases: a file containing user added aliases

# Help aliases
alias info='info --vi-keys'

# Editor aliases
alias gi='vim -g'
alias vi='vim'

# Listing aliases
alias l.='ls -d .[!.]* --color=auto 2> /dev/null'
#; if [ $? != 0 ]; then echo "No dotfiles present"; fi'
alias li='ls -li --color=auto'
alias ll='ls -l --color=auto'
#alias lA='ls -A'

alias ghc='ghc -hidir /tmp -odir /tmp'

# PS1 prompt for ubuntu
#PS1='\u@\h:\w\$ '

# List and sort?
#alias lss='ls -ACq --color='always' | sort -t '.' -k2' # Almost works, see examples.d...
#alias lA='ls -ACqX --color=always'
#echo -e "$(ls -Cq --color=always)\n$(ls -Cdq .[!.]* --color=always)"

# List and categorize
# Number of files next to category? ((none) or 1...)
#alias lf="\
#echo -e '$(tput setaf 7)Normal:$(tput sgr 0)'; \
#ls -Cq --color=always; \
#echo -e '$(tput setaf 7)Hidden:$(tput sgr 0)'; \
#ls -d .[!.]* --color=always 2> /dev/null"

# Categorize ALL files and print to stdout
# ERROR CASES:
## Cannot detect files predicate with 2 or more dots (i.e. "..file")
## Will show "Normal:" or "Hidden:" Even when no files exist
## Solving both problems by including symbolic links (. ..)
## May add "Other:" categorie for files beginning with unique characters

# Use new function
#lf () {
#	echo -e "$(tput setaf 7)Normal:$(tput sgr 0)"
#	ls -Cq --color=always
#	echo -e "$(tput setaf 7)Hidden:$(tput sgr 0)"
#	ls -Cdq .* --color=always 2> /dev/null
#}

# Miscellaneous aliases
alias redshift='redshift-gtk'

# Sudo does not work with aliases without an additional space
alias sudo='sudo '

# Default to human readable outputs
alias df='df -h'
alias free='free -h'

# Add custom sripts to path (~/.sripts)
# Aliases for using scripts
if [ -d "$HOME/.scripts" ] ; then
	PATH="$PATH:$HOME/.scripts"
fi

# Add path for scripts in progress (unfinished) for easier testing
if [ -d "$HOME/.scriptst" ] ; then
	PATH="$PATH:$HOME/.scriptst"
fi

# Aliases for scripts that replace or modify pre-existing program behavior
alias tilda="$HOME/.scripts/tildash"
alias pm-suspend="$HOME/.scripts/pm-suspend"

# Change beep to visual representation
# Critical urgency allows notification in fullscreen applications
# Icon: /usr/share/icons/Ultra-Flat/actions/scalable/stock_about.svg
# Icon: /usr/share/icons/Ultra-Flat/emblems/scalable/emblem-ok.svg
# Aliases are not expanded in scripts, but functions do expand

# Visual beep
export ICN='/usr/share/icons/Ultra-Flat/emblems/scalable/emblem-ok.svg'
beep () {
	notify-send -u critical -i $ICN 'beep'
}

# Notifications
export NICN='/usr/share/icons/Ultra-Flat/actions/scalable/stock_about.svg'
notify () {
	notify-send -u critical -i $NICN "$1" "$2"
}


#!/bin/bash

# lf: A function to display an organized list of normal and hidden files.
# Useful for getting a quick read on certain directories

# Almost works but '..directory' will not show
#HIDDEN="$(cd $1 && ls -Cdq .[!.]* --color=always 2> /dev/null)"
# Using ls --ignore=pattern solves many problems

# Columns misbehaving (i.e. lftest /etc has 3 colums instead of 5)
# Solved by removal of echo command (i.e. echo "$(ls... ))
# But now will not display '(none)'
# Keeping NORMAL and HIDDEN variables to test if empty

lf () {

	# Declare directory
	if [ -d "$1" ]; then
		local dir="$(tput setaf 6)$(readlink -f $1)$(tput sgr 0)"
	elif [ "$#" -eq 0 ]; then
		local dir="$(tput setaf 6)$(pwd)$(tput sgr 0)"
	else
		echo "$(tput setaf 1)No dice, compadre$(tput sgr 0)"
		return 1
	fi

	# Display normal files
	echo "$(tput setaf 7)Normal Files: $dir:$(tput sgr 0)"
	NORMAL="$(ls -Cq --color=always $1)"
	if [ -z "$NORMAL" ]; then
		echo "$(tput setaf 1)(none)$(tput sgr 0)"
	else
		#echo "$(ls -Cq --color=always $1)"
		ls -Cq --color=always --group-directories-first $1
	fi

	# Display hidden files
	echo "$(tput setaf 7)Hidden Files: $dir:$(tput sgr 0)"
	HIDDEN="$(ls -ACq --ignore=[!.]* $1 --color=always 2> /dev/null)"
	if [ -z "$HIDDEN" ]; then
		echo "$(tput setaf 1)(none)$(tput sgr 0)"
	else
		#echo "$(ls -ACq --ignore=[!.]* $1 --color=always 2> /dev/null)"
		ls -ACq --ignore=[!.]* $1 --color=always --group-directories-first 2> /dev/null
	fi

}
