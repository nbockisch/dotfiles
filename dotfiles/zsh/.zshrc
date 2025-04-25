# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nathan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

# Default apps
export EDITOR="nvim"

export GCM_CREDENTIAL_STORE="gpg"

# Aliases
alias v="nvim"

# Enable smart cd with zoxide
eval "$(zoxide init zsh)"
