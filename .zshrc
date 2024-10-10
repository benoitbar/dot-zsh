# see https://github.com/ohmyzsh/ohmyzsh/issues/12328
# fix bullettrain  git prompt bug
zstyle ':omz:alpha:lib:git' async-prompt no

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh

# Set ZSH_CACHE_DIR to the path where cache files should be created
ZSH_CACHE_DIR=$HOME/.zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fnm git npm pip python docker) # see ~/.zshrc-local for plugins override

DEFAULT_USER="benben"

#ZSH_TMUX_AUTOSTART=true

## configure bullettrain
prompt_npm() {
  local npm_prompt
  if type npm >/dev/null 2>&1; then
    prompt_segment $BULLETTRAIN_NVM_BG $BULLETTRAIN_NVM_FG "/ $(npm --version)"
  fi
}

prompt_nixshell() {
  if [[ ! -z ${NIX_STORE} ]]; then
    prompt_segment red $BULLETTRAIN_CUSTOM_FG "λ"
  fi
}

BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    context
    dir
    screen
#    perl
#    ruby
    virtualenv
    nixshell
    npm
#    aws
#    go
#    rust
#    elixir
    git
#    hg
    cmd_exec_time
)
BULLETTRAIN_CONTEXT_DEFAULT_USER="benben"
BULLETTRAIN_VIRTUALENV_PREFIX="⌘"
##

# Put this configuration in .zsh/00-local.zsh file
# export DEBEMAIL="..."
# export DEBFULLNAME="..."

#export PATH="/usr/local/p/versions/python:$PATH"

## configure pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
##

test -f ~/.zshrc-local && source ~/.zshrc-local
source $ZSH/oh-my-zsh.sh

## ZI
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

## plugins initialization with ZI
zi ice wait lucid atinit'ZSH_FNM_ENV_EXTRA_ARGS=--use-on-cd'
zi light "dominik-schwabe/zsh-fnm"
