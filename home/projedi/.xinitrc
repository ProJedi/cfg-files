#!/bin/sh

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr -solid '#002b36' &
#conky &
# Will start without a password due to sudo config
sudo xfce4-power-manager

exec ck-launch-session xmonad
