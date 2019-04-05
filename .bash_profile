#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
export PAGER=less
export BROWSER=firefox
export TERMINAL=urxvt

# launch X server as soon as I login
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx &> /dev/null
fi

