#!/bin/bash
#TouchpadIs ON
#$(synclient -l | grep TouchpadOff | awk '{print $3}') == 1 
msgId="1001"
stat=$(head -2 ~/.scripts/.toggletouchpad.sh | grep TouchpadIs | cut -d " " -f2) 
if [ "$stat" == "Off" ]
then
#synclient touchpadoff=0;
#synclient clickpad=0;
xinput enable AlpsPS/2\ ALPS\ GlidePoint
#notify-send -t 1000 "Touchpad" "activado" -i /home/earving/.scripts/touchon.png
im=/home/earving/.scripts/touchon.png
dunstify -a "Touchpad" -t 1000 -r "$msgId" "Touchpad" "activado" -i "$im"
sed -i '2s/.*/#TouchpadIs ON/' ~/.scripts/.toggletouchpad.sh
else
#synclient touchpadoff=1;
#synclient clickpad=1;
xinput disable AlpsPS/2\ ALPS\ GlidePoint
#notify-send -t 1000 "Touchpad" "desactivado" -i /home/earving/.scripts/touchoff.png
im=/home/earving/.scripts/touchoff.png
dunstify -a "Touchpad" -t 1000 -r "$msgId" "Touchpad" "desactivado" -i "$im"
sed -i '2s/.*/#TouchpadIs Off/' ~/.scripts/.toggletouchpad.sh
fi
