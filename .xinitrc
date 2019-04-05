# map caps lock to escape
setxkbmap -option caps:escape
# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# start window manager
exec i3
