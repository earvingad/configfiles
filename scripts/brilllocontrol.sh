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
xbacklight +5
killall xfce4-notifyd
#notify-send -t 2000 "Brillo" "  `xbacklight | egrep -o "[0-90]+" | head -1`%" -i /home/earving/.scripts/brightup.png
im=/home/earving/.scripts/brightup.png
dunstify -a "changeBrightness" -t 2000 -r "$msgId" "Brillo" "  `xbacklight | egrep -o "[0-90]+" | head -1`%" -i "$im"
;;

"down")
xbacklight -5
killall xfce4-notifyd
#notify-send -t 2000 "Brillo" "  `xbacklight | egrep -o "[0-90]+" | head -1`%" -i /home/earving/.scripts/brightdown.png
im=/home/earving/.scripts/brightdown.png
dunstify -a "changeBrightness" -t 2000 -r "$msgId" "Brillo" "  `xbacklight | egrep -o "[0-90]+" | head -1`%" -i "$im"

;;

esac
