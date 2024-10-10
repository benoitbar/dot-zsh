# editor
export EDITOR='vim'

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# added by Nix installer
if [ -e /home/benben/.nix-profile/etc/profile.d/nix.sh ]; then . /home/benben/.nix-profile/etc/profile.d/nix.sh; fi
