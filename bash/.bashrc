#
# ~/.bashrc
#

#########
# Setup #
#########

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# . "$HOME/.cargo/env"

# Custom script path
export PATH=$PATH:$HOME/.scripts/

# Enable zoxide
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)"

################
# Autocomplete #
################
bind -s 'set completion-ignore-case on'

# Bootstrap ble.sh install and enable it for autocompletions, syntax
# highlighting, etc.
#BASH_HOME=$HOME/.config/bash
#BLESH_PATH=$HOME/.local/share/blesh/ble.sh
#if [ ! -f $BLESH_PATH ]; then
#    echo "Installing ble.sh..."
#    mkdir -p $BASH_HOME
#    git clone --recursive https://github.com/akinomyoga/ble.sh.git $BASH_HOME/ble.sh
#    make install -C $BASH_HOME/ble.sh
#fi
#
#[[ $- == *i* ]] && source $BLESH_PATH --noattach --rcfile $BASH_HOME/.blerc

####################
# Global Variables #
####################

BASH_HOME=$HOME/.config/bash
EDITOR='nano'
if [ -x "$(command -v nvim)" ]; then
    EDITOR='nvim'
elif [ -x "$(command -v vim)"]; then
    EDITOR='vim'
elif [ -x "$(command -v vi)"]; then
    EDITOR='vi'
fi

################
# Default Apps #
################

export BROWSER='firefox'
export TERMINAL='alacritty'
export EDITOR=$EDITOR
export VISUAL=$EDITOR

###########
# Aliases #
###########

alias v=$EDITOR
alias ls=$([ -x "$(command -v exa)" ] && echo 'exa --icons' || echo 'ls --color=auto')
alias s='startx'
alias grep=$([ -x "$(command -v rg)" ] && echo 'rg --color=auto' || echo 'grep --color=auto')
alias cat=$([ -x "$(command -v bat)" ] && echo 'bat --paging=never --style=plain' || echo 'cat')
alias less=$([ -x "$(command -v bat)" ] && echo 'bat' || echo 'less')
alias df=$([ -x "$(command -v duf)" ] && echo 'duf' || echo 'df')
alias du=$([ -x "$(command -v dust)" ] && echo 'dust' || echo 'du')
alias find=$([ -x "$(command -v fd)" ] && echo 'fd' || echo 'find')

# Shortcuts
alias tn='tmux new -s $(basename $(pwd))' # Name tmux session after current dir

##########
# Prompt #
##########

# Bootstrap the git prompt script
mkdir -p $BASH_HOME
[[ -f $BASH_HOME/git-prompt.sh ]] || curl --http1.1 https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output $BASH_HOME/git-prompt.sh
source $BASH_HOME/git-prompt.sh

# Colors
FGBLACK='\[\e[30m\]'
FGRED='\[\e[31m\]'
FGGREEN='\[\e[32m\]'
FGYELLOW='\[\e[33m\]'
FGBLUE='\[\e[34m\]'
FGMAGENTA='\[\e[35m\]'
FGCYAN='\[\e[36m\]'
FGWHITE='\[\e[37m\]'
BGBLACK='\[\e[40m\]'
BGRED='\[\e[41m\]'
BGGREEN='\[\e[42m\]'
BGYELLOW='\[\e[44m\]'
BGBLUE='\[\e[44m\]'
BGMAGENTA='\[\e[45m\]'
BGCYAN='\[\e[46m\]'
BGWHITE='\[\e[47m\]'
BRIGHT_BLACK='\[\e[90m\]'
BRIGHT_RED='\[\e[91m\]'
BRIGHT_GREEN='\[\e[92m\]'
BRIGHT_YELLOW='\[\e[93m\]'
BRIGHT_BLUE='\[\e[94m\]'
BRIGHT_MAGENTA='\[\e[95m\]'
BRIGHT_CYAN='\[\e[96m\]'
BRIGHT_WHITE='\[\e[97m\]'
END='\[\e[0m\]'

get_git_branch() {
    echo '$(__git_ps1 " ( %s)")'
}

#PS1="${FGGREEN}\u${END} ${FGBLACK}on${END} ${FGBLUE}\h${END} ${FGBLACK}in${END} ${FGYELLOW}\w${END}${FGRED}$(get_git_branch)${END}\r\n${FGYELLOW}󱞪${END} "
PS1="${FGGREEN}\u${END} ${FGBLACK}on${END} ${FGBLUE}\h${END} ${FGBLACK}in${END} ${FGYELLOW}\w${END}${FGRED}$(get_git_branch)${END}\r\n${FGYELLOW}>${END} "

###########
# History #
###########

# Dont save duplicate commands or commands with leading space
export HISTCONTROL=ignoreboth

export HISTSIZE=10000

# After all is said and done, attach ble.sh
# [[ ${BLE_VERSION-} ]] && ble-attach
