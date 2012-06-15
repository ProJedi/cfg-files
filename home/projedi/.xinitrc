#!/bin/sh

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr -solid '#002b36' &
conky &

exec ck-launch-session xmonad
