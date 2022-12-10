# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

##############################
# PATH
##############################
# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GO
export PATH=$PATH:/usr/local/go/bin

# Cargo 
export PATH=$PATH:$HOME/.cargo/bin

# Flutter 
export PATH=$PATH:$HOME/.flutter/bin:
export PATH="$PATH":"$HOME/.pub-cache/bin"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

##############################
# Zplug
##############################

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Zplug plugins
zplug "zplug/zplug"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug 'plugins/git', from:oh-my-zsh

zplug load

source $ZSH/oh-my-zsh.sh
