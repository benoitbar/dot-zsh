# editor
export EDITOR='vim'

# To enable the keyring for applications run through the terminal, such as SSH
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# added by Nix installer
if [ -e /home/benben/.nix-profile/etc/profile.d/nix.sh ]; then . /home/benben/.nix-profile/etc/profile.d/nix.sh; fi
