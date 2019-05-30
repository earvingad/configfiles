#!/bin/bash

case $1 in 

"-u")
  MODE="up"
  ;;
"-d")
  MODE="down"
  ;;

esac
msgId="2112"
case $MODE in
"up")
xbacklight -inc 10
#notify-send -t 2000 "Brillo" "  `xbacklight | egrep -o "[0-90]+" | head -1`%" -i /home/earving/.scripts/brightup.png
im=/home/earving/.scripts/brightup.png
brillo=$(xbacklight -get)
dunstify -a "changeBrightness" -t 2000 -r "$msgId" "Brillo" "  `printf '%.*f\n' 0 $brillo`%" -i "$im"
;;

"down")
xbacklight -dec 10
#notify-send -t 2000 "Brillo" "  `xbacklight | egrep -o "[0-90]+" | head -1`%" -i /home/earving/.scripts/brightdown.png
im=/home/earving/.scripts/brightdown.png
brillo=$(xbacklight -get)
dunstify -a "changeBrightness" -t 2000 -r "$msgId" "Brillo" "`printf '%.*f\n' 0 $brillo`%" -i "$im"

;;

esac
