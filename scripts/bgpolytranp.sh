#!/bin/sh
#Select color to use as bg for polybar (color0-16)
read -p "which color to use as polybar bg (0-16):" n
color=$(($n + 1))
#Getting the color
bg=$(sed -n "$color,"$color"p" .cache/wal/colors | cut -d "#" -f2)

#Writing the color in polybar config file
#make sure "back = $80xxxxxx" is always in line 8
sed -i "32s/.*/back = #80$bg/" ~/.config/polybar/config

#Restart polybar
~/.config/polybar/launchpolybar.sh  
