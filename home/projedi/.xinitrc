#!/bin/sh

xrdb -merge ~/.Xresources
urxvtd -q -f -o
#xscreensaver -no-splash &
xsetroot -cursor_name left_ptr -solid '#151515' &
setxkbmap "us, ru" -option grp:caps_toggle
devmon --exec-on-drive 'notify-send "Mount %l on %d"' &

exec xmonad
