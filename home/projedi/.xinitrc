#!/bin/sh

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xsetroot -cursor_name left_ptr -solid '#151515' &
setxkbmap "us, ru" -option grp:caps_toggle
# Just to notify about mounts. Automounting is done via ldm.
udisks-glue --config /etc/udisks-glue.conf
jack_control start

exec xmonad
