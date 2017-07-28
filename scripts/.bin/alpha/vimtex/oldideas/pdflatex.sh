# Open tex document side by side with evince pdf

# Start prog1
# Send it to background, but keep printing its output
# Start prog2, and keep in foreground (gvim for immediate editing)
# When prog2 is closed, prog1 will return to foreground
evince $1.pdf & gvim $1.tex && fg
