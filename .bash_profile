#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# default apps
export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
export TERMINAL=termite

# adding my scripts folder to PATH
export PATH="$PATH:$HOME/bin:$HOME/bin/blocks"

# some configs for bat and fzf
export BAT_THEME="DarkNeon"
export BAT_STYLE="numbers,changes"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_ALT_C_COMMAND='find . -type d'
export FZF_DEFAULT_OPTS='--multi --height 50% --reverse 
                         --preview "bat --color=always -p {} || tree {} || echo Preview is unavailable"
                         --preview-window right:hidden --bind f1:toggle-preview
                         --color hl:10,hl+:10,pointer:10,marker:10'

# viewing man pages in vim
export MANPAGER="/bin/sh -c \"col -bx | nvim -MRc 'set ft=man nolist nonu' -\""

# launch X server as soon as I login
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx &> /dev/null
fi

