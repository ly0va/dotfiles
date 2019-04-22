#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# colorful aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ignore duplicate lines and lines starting with space
HISTCONTROL=ignoreboth
# set history size
HISTSIZE=1000
HISTFILESIZE=1000

# append to the history file, not overwrite
shopt -s histappend

# update values of LINES and COLUMNS after each command
shopt -s checkwinsize
# glob pattern ** will match all files and zero or more directories and subdirectories
shopt -s globstar
# no need to type cd to change directory
shopt -s autocd
# disable Ctrl-S / Ctrl-Q that freeze / unfreeze the terminal
stty -ixon

# set a pretty prompt
PS1="\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\n\\$ "    

# keybindings and tab-completion for fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# some sane fzf settings
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_ALT_C_COMMAND='ag --hidden -g "" --ignore .git | xargs dirname | sort | uniq'
export FZF_DEFAULT_OPTS='--multi --height 50% --reverse 
                         --preview "bat --color=always --style=plain {} || echo Preview is unavailable"
                         --preview-window right:hidden --bind f1:toggle-preview
                         --color hl:10,hl+:10,pointer:10,marker:10'
bind -x '"\ef": "fzf-file-widget"'
bind "$(bind -s | grep history | sed 's/\\C-r/\\ed/')"
bind -r "\C-r"
