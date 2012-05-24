#!/bin/sh

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr -solid black &
conky &

exec ck-launch-session xmonad
