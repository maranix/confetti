ZSH_THEME="robbyrussell"

#######################################
#
#             PATH EXPORTS
#
#######################################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# NVM PATH
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GOPATH & GOBIN
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.local/bin/go
export GOBIN=$HOME/.local/bin/go/bin
export PATH=$PATH:$HOME/.local/bin/go/bin

# Cargo PATH
export CARGO_HOME=$HOME/.local/bin/cargo
export RUSTUP_HOME=$HOME/.local/bin/rustup
export PATH=$PATH:$HOME/.local/bin/cargo/bin
export PATH=$PATH:$HOME/.local/bin/rustup/bin

# Flutter PATH
export PATH=$PATH:$HOME/.local/bin/flutter/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"

export ZSH="$HOME/.oh-my-zsh"

#######################################
#
#             PATH EXPORTS
#
#######################################

#######################################
#
#               ZPLUG
#
#######################################
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "Tarrasch/zsh-bd", defer:2
zplug "Aloxaf/fzf-tab", defer:2
zplug "plugins/git",   from:oh-my-zsh, defer:2

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

zplug load
#######################################
#
#               ZPLUG
#
#######################################

source $ZSH/oh-my-zsh.sh

# Use FZF searching history, files and changing directory.
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

# Enable Vim Mode ( Esc to enter )
bindkey -v
