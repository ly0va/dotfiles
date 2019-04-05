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
PS1="\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\n\\$ "    

# display system info and arch logo
# neofetch --color_blocks off
