# editor
export EDITOR='vim'

# To enable the keyring for applications run through the terminal, such as SSH
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
if [[ ! -d $WORKON_HOME ]]; then
  mkdir $WORKON_HOME
fi