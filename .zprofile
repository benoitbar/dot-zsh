# Add dotfiler's bin directory to the path
if [ -e $HOME/.dotfiles/bin ]; then
   export PATH=$HOME/.dotfiles/bin:$PATH
fi

# Use ~/.bin directory to link
# all useful scripts into it
if [ -e $HOME/.bin ]; then
   export PATH=$HOME/.bin:$PATH
fi

# Use ~/bin directory to link
# all useful scripts into it
if [ -e $HOME/bin ]; then
   export PATH=$HOME/bin:$PATH
fi

# Add .local/bin directory to the path
if [ -e $HOME/.local/bin ]; then
   export PATH=$HOME/.local/bin:$PATH
fi

# Add /urs/local/bin directory to the path
if [ -e /usr/local/bin ]; then
   export PATH=/usr/local/bin:$PATH
fi
