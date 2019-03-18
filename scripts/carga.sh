#!/bin/bash

case $1 in 

"-u")
	MODE="up"
	;;
"-d")
	MODE="down"
	;;

esac

case $MODE in
"up")
capacity=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY= | cut -d "=" -f2)
status=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_STATUS= | cut -d "=" -f2)

if [ "$status" == "Charging" ]
then
status=Cargando
else
status=Descargando
fi

if [ "$capacity" == "100" ]
then
#notify-send -t 1 "Batería Cargada" -u critical -i "/home/earving/.conky/bat90.png"
notify-send -t 1 "Batería Cargada" -u critical -i "battery-full"
elif [ "$capacity" -ge "95" ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-low.png
#im=/home/earving/.conky/bat90.png 
im=battery-full
elif [ "$capacity" -ge "71" ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-medium.png
#im=/home/earving/.conky/bat70.png
im=battery-medium
elif [ "$capacity" -ge "40" ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.conky/bat30.png 
im=battery-low
elif [ "$capacity" -ge "11" ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.conky/bat20.png 
im=battery-low
elif [ "$capacity" -ge "1" ]
then
#notify-send -t 1 "$de" -i /home/earving/.scripts/audio-volume-high.png
im=/home/earving/.conky/bat10.png 
im=battery-empty
fi


notify-send "$status" "     $capacity%" -i "$im"
;;


"down")
capacity=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY= | cut -d "=" -f2)
status=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_STATUS= | cut -d "=" -f2)

if [ "$status" == "Charging" ]
then
	while [ "$capacity" != "100" ]
	do
	capacity=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY= | cut -d "=" -f2)
		if [ "$capacity" == "100" ]
		then
		notify-send -t 1 "Batería Cargada" -u critical -i "/home/earving/.conky/bat90.png"
		break
		fi
	sleep 5m
	done
fi
;;

esac
