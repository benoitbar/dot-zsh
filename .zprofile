# Add dotfiler's bin directory to the path
if [ -e ~/.dotfiles/bin ]; then
   export PATH=~/.dotfiles/bin:$PATH
fi

# Use ~/.bin directory to link
# all useful scripts into it
if [ -e ~/.bin ]; then
   export PATH=~/.bin:$PATH
fi

# Add .local/bin directory to the path
if [ -e ~/.local/bin ]; then
   export PATH=~/.local/bin:$PATH
fi