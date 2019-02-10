source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow
antigen bundle docker
antigen bundle yarn
antigen bundle npm
antigen bundle composer
antigen bundle aws

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle popstas/zsh-command-time

# Load the theme.
antigen theme robbyrussell

# Defaults
#export TERM=/usr/bin/termite
export EDITOR=/usr/bin/vim

# source custom files
source ~/dotfiles/.paths
source ~/dotfiles/.aliases

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# PHP
#export PHPENV_ROOT="/home/fnandogp/.phpenv"
#eval "$(phpenv init -)"

# Tell Antigen that you're done.
antigen apply
