# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vim='nvim'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias git='hub'
alias torrent='transmission-cli'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rns'
alias gdb='gdb -q'
alias ranger='. ranger'
alias rgr='. ranger'
alias r='. ranger'
alias ipython='python3 -m IPython --no-banner'
alias ipython2='python2 -m IPython --no-banner'
alias ino='arduino-cli'

py() {
    python2 -c "print $@"
}

# ignore duplicate lines and lines starting with space
HISTCONTROL=ignoreboth
# set history size
HISTSIZE=-1
HISTFILESIZE=-1

prompt_command() {
    errno=$?
    [ $errno != 0 ] && echo -en "\e[31m-[$errno]-\e[m"
    history -a
    history -c
    history -r
}

# append to history file immediately
PROMPT_COMMAND="prompt_command"

# append to the history file, not overwrite
shopt -s histappend
# update values of LINES and COLUMNS after each command
shopt -s checkwinsize
# glob pattern ** will match all files and zero or more directories and subdirectories
shopt -s globstar
# no need to type cd to change directory
shopt -s autocd
# Correct spelling errors during tab-completion
shopt -s dirspell
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell
# disable Ctrl-S / Ctrl-Q that freeze / unfreeze the terminal
stty -ixon

# set a pretty prompt
PS1="\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\n\\$ "

# keybindings and tab-completion for fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
bind -x '"\ef": "fzf-file-widget"'
bind -x '"\ed": "__fzf_history__"'

