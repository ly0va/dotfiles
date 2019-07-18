#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# colorful aliases
alias ls='lsd'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vim='nvim'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias tmux='tmux -f ~/.config/tmux.conf'
alias youtube='youtube-viewer -W'
alias git='hub'
alias torrent='transmission-cli'
alias pacs='sudo pacman -S'

# ignore duplicate lines and lines starting with space
HISTCONTROL=ignoreboth
# set history size
HISTSIZE=
HISTFILESIZE=

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
bind -x '"\ef": "fzf-file-widget"'
bind "$(bind -s | grep history | sed 's/\\C-r/\\ed/')"
bind -r "\C-r"
