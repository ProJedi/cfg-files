#!/bin/sh

set $*

case "$1" in
   button/power)
      logger "ACPI action: power button($2 $3 $4)"
      systemctl suspend
      ;;
   button/sleep)
      logger "ACPI action: sleep button($2 $3 $4)"
      ;;
   ac_adapter)
      logger "ACPI action: adapter($2 $3 $4)"
      ;;
   battery)
      logger "ACPI action: battery($2 $3 $4)"
      ;;
   button/lid)
      logger "ACPI action: lid($2 $3 $4)"
      case "$3" in
         close)
            systemctl suspend
            ;;
      esac
      ;;
   video/brightnessup)
      path=/sys/class/backlight/nv_backlight
      max=`cat $path/max_brightness`
      cur=`cat $path/brightness`
      if [[ $cur -lt $max ]]; then
         echo $((cur + 5)) > $path/brightness
      fi
      ;;
   video/brightnessdown)
      path=/sys/class/backlight/nv_backlight
      cur=`cat $path/brightness`
      if [[ $cur -gt 0 ]]; then
         echo $((cur - 5)) > $path/brightness
      fi
      ;;
   *)
      logger "ACPI action: undefined($1 $2 $3 $4)"
      ;;
esac
