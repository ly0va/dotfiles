#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# default apps
export EDITOR=vim
export PAGER=less
export BROWSER=firefox
export TERMINAL=urxvt

# adding my scripts folder to PATH
export PATH="$PATH:$HOME/bin"

# launch X server as soon as I login
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx &> /dev/null
fi

