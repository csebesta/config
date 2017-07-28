#!/bin/bash
# Dirty script for creating a simple latex editing environment
# Requires gvim, and xdotool

pdflatex $1
evince test.pdf &; xdotool key ctrl+super+Right
gvim $1 && fg; xdotool key ctrl+super+Left
#pdflatex $1
