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

icon(){
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

  #notify-send -t 1000 "$de%" -i "$im"
  dunstify -a "changeVolume" -t 1000 -r "$msgId" "Volume" "   $de%" -i "$im"
}


case $MODE in
"up")
#amixer set Master 5%+ | notify-send -t 2000 "Volumen" "`amixer get Master | egrep -o "[0-9]+%"`" -i /home/earving/.scripts/audio-volume-high.png

  pulsemixer --change-volume +5

  de=$(pulsemixer --get-volume | cut -d " " -f 1)
  icon
;;

"down")
#amixer set Master 5%- | notify-send -t 2000 "Volumen" "`amixer get Master | egrep -o "[0-9]+%"`" -i /home/earving/.scripts/audio-volume-low.png

  pulsemixer --change-volume -5

  de=$(pulsemixer --get-volume | cut -d " " -f 1)
  icon
;;

"mute")

  pulsemixer --toggle-mute

  a=$(pulsemixer --get-mute)

    if [ $a = 1 ]
    then

#killall xfce4-notifyd
#amixer set Master toggle && notify-send -t 2000 "Mute" -i /home/earving/.scripts/audio-volume-muted.png
#notify-send -t 1000 "Mute" -i /home/earving/.scripts/audio-volume-muted.png
    im=/home/earving/.scripts/audio-volume-muted.png
    dunstify -a "changeVolume" -t 1000 -r "$msgId" "MUTE" -i "$im"
    else
    de=$(pulsemixer --get-volume | cut -d " " -f 1)
    icon
#killall -HUP xfce4-notifyd
#notify-send -t 1000 "$de%" -i "$im"
    fi
;;

"click")
    de=$(pulsemixer --get-volume | cut -d " " -f 1)
    icon
;;
esac
