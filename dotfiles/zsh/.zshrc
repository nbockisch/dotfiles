##############
# COMPLETION #
##############
autoload -U compinit; compinit

############
# VIM KEYS #
############
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

###########
# HISTORY #
###########
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt SHARE_HISTORY

###########
# ALIASES #
###########
alias v="nvim"

################
# DEFAULT APPS #
################
export EDITOR="nvim"
export VISUAL="bat"
export PAGER="bat"
export BROWSER="xdg-open"

###################
# SHELL APP SETUP #
###################
export PATH="$HOME/.krew/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Change directory with yazi
function y() {
    local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
    command rm -f -- "$tmp"
}
