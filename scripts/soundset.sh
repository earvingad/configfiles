#!/bin/sh

sd=$(cat ~/.asoundrc | grep SoundIs | cut -d " " -f4)

#if [ "$sd" == "Normal" ]
#then
# ds=HDMI
#else
# ds=Normal
#fi

#dialog  --colors --title "Sound output selection" \
# --msgbox "Output is set to \Zb$sd\Zn"  10 30
#dialog  --colors --title "Sound output selection" \
# --yesno "Change it to \Zb$ds\Zn?" 10 30
#if [ "$?" == "0" ]
#then
#if [ "$sd" == "Normal" ]
#then
# sed -i '8s/.*/pcm "hw:0,3" #SoundIs HDMI/' ~/.asoundrc
#else
# sed -i '8s/.*/pcm "hw:0,0" #SoundIs Normal/' ~/.asoundrc
#fi
#fi
#dialog --colors --title "Sound output selection" \
#       --msgbox "Sound output is set to \Zb$FN\Zn now." 10 30


# Using Rofi as selection box
confirm(){
    echo -e "Yes\nNo" | rofi -dmenu -i -theme colors-rofi-dark -lines 2 -font "Source\ Code\ Pro 12" -format d -selected-row 0 -p "${1:-Sound output is set to "$sd", Change it?}"
}

if [ $(confirm) = 1 ]
    then
    if [ "$sd" == "Normal" ]
    then
        sed -i '8s/.*/pcm "hw:0,3" #SoundIs HDMI/' ~/.asoundrc
    else
        sed -i '8s/.*/pcm "hw:0,0" #SoundIs Normal/' ~/.asoundrc
    fi
fi
FN=$(cat ~/.asoundrc | grep SoundIs | cut -d " " -f4)

actual=$(echo -e $FN | rofi -dmenu -i -theme colors-rofi-dark -lines 2 -font "Source\ Code\ Pro 12" -markup-rows -p "Sound is set to")

case $actual in 
    $FN)
        exit;;
esac
#notify-send -t 3000 "Sound is set to $FN		"

