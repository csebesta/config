#!/bin/bash
# Dirty script for creating a simple latex editing environment
# Requires gvim, and xdotool

#pdflatex $1
gvim &
evince &

wid1='xdotool search --onlyvisible --name 'GVim''
if test "$wid1"=""
	then
	exec gvim &
	exit
fi

actual='xdotool getactivewindow'
if test $wid1=$actual
	then
	xdotool windowminimize $wid1
	else
	xdotool windowactivate $wid1
fi
#xdotool search --name "Document Viewer" key ctrl+super+Right
#xdotool search --name "GVim" key ctrl+super+Left
#pdflatex $1
