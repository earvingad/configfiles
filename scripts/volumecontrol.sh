#!/bin/bash

case $1 in 

"-u")
  MODE="up"
  ;;
"-d")
  MODE="down"
  ;;
"-m")
  MODE="mute"
  ;;
"-c")
  MODE="click"
  ;;
esac

msgId="1221"
case $MODE in
"up")
#amixer set Master 5%+ | notify-send -t 2000 "Volumen" "`amixer get Master | egrep -o "[0-9]+%"`" -i /home/earving/.scripts/audio-volume-high.png

amixer set Master 5%+

de=$( amixer get Master | grep Mono: | cut -d " " -f6 | egrep -o "[0-9]+")

if [ $de -lt 30 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-low.png
im=/home/earving/.scripts/audio-volume-low.png 

elif [ $de -gt 30 ] && [ $de -le 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-medium.png
im=/home/earving/.scripts/audio-volume-medium.png 

elif [ $de -gt 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.scripts/audio-volume-high.png 
fi

#killall -HUP xfce4-notifyd
#unotify-send -t 1000 "$de%" -i "$im"
dunstify -a "changeVolume" -t 1000 -r "$msgId" "$de%" -i "$im"

;;

"down")
#amixer set Master 5%- | notify-send -t 2000 "Volumen" "`amixer get Master | egrep -o "[0-9]+%"`" -i /home/earving/.scripts/audio-volume-low.png
amixer set Master 5%-

de=$( amixer get Master | grep Mono: | cut -d " " -f6 | egrep -o "[0-9]+")

if [ $de -gt 0 ] && [ $de -le 30 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-low.png
im=/home/earving/.scripts/audio-volume-low.png 

elif [ $de -gt 30 ] && [ $de -le 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-medium.png
im=/home/earving/.scripts/audio-volume-medium.png 

elif [ $de -gt 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.scripts/audio-volume-high.png 
fi

if [ $de -eq 0 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-muted.png
im=/home/earving/.scripts/audio-volume-muted.png
fi

killall -HUP xfce4-notifyd
#notify-send -t 1000 "$de%" -i "$im"
dunstify -a "changeVolume" -t 1000 -r "$msgId" "$de%" -i "$im"
;;

"mute")
amixer set Master toggle
a=$(amixer get Master | egrep -o "off")

if [ $a == "off" ]
then

#killall xfce4-notifyd
#amixer set Master toggle && notify-send -t 2000 "Mute" -i /home/earving/.scripts/audio-volume-muted.png
#notify-send -t 1000 "Mute" -i /home/earving/.scripts/audio-volume-muted.png
im=/home/earving/.scripts/audio-volume-muted.png
dunstify -a "changeVolume" -t 1000 -r "$msgId" "MUTE" -i "$im"
else
d=$( amixer get Master | egrep -o "[0-9]+%")
de=$( echo "$d" | egrep -o "[0-9]+")

if [ $de -gt 0 ] && [ $de -le 30 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-low.png
im=/home/earving/.scripts/audio-volume-low.png 

elif [ $de -gt 30 ] && [ $de -le 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-medium.png
im=/home/earving/.scripts/audio-volume-medium.png 

elif [ $de -gt 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.scripts/audio-volume-high.png 
fi

if [ $de -eq 0 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-muted.png
im=/home/earving/.scripts/audio-volume-muted.png
fi

#killall -HUP xfce4-notifyd
#notify-send -t 1000 "$de%" -i "$im"
dunstify -a "changeVolume" -t 1000 -r 1221 "$de%" -i "$im"
fi
;;

"click")
de=$( amixer get Master | grep Mono: | cut -d " " -f6 | egrep -o "[0-9]+")

if [ $de -lt 30 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-low.png
im=/home/earving/.scripts/audio-volume-low.png 

elif [ $de -gt 30 ] && [ $de -le 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-medium.png
im=/home/earving/.scripts/audio-volume-medium.png 

elif [ $de -gt 80 ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.scripts/audio-volume-high.png 
fi

notify-send -t 1000 "$de%" -i "$im"

;;
esac
