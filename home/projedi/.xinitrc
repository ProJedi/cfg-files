#!/bin/sh

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr -solid '#002b36' &
devmon --exec-on-drive 'notify-send "Mount %l on %d"' &

exec xmonad
