#!/usr/bin/env bash

[ -z "$1" ] && echo "No direction provided" && exit 1

amount="2 px or 2 ppt"

move() {
    i3-msg resize "$1" "$2" "$amount" | grep '"success":true' || \
    i3-msg resize "$3" "$4" "$amount"
}

case $1 in
    up)
        move grow up shrink down ;;
    down)
        move shrink up grow down ;;
    left)
        move shrink right grow left ;;
    right)
        move grow right shrink left ;;
esac

