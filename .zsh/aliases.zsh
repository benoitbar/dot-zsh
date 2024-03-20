# ls aliases
alias ls='ls --color'
alias l='ls'
alias ll='ls -l -h'
alias la='ll -a'

#grep aliases
alias grep='grep'

# swap aliases
alias purgeswap='sudo swapoff -a && sudo swapon -a'

alias updatemirrorlist='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
