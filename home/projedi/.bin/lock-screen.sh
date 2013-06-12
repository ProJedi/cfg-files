#!/bin/bash

scrot /tmp/lockscreen.png
convert /tmp/lockscreen.png -scale 50% -blur 2x2 -scale 200% -type Grayscale -brightness-contrast -10 /tmp/lockscreen-out.png
i3lock -i /tmp/lockscreen-out.png
