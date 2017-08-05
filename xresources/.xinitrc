# Merge xresources
if [ -f "$HOME/.Xresources" ]; then
	xrdb -merge "$HOME/.Xresources"
fi

# Start xbindkeys
xbindkeys
