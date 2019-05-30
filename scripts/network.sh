#!/bin/sh

fileroot=/etc/netctl
#array=( $(ls -p $fileroot | grep -v /) )
#n=0
#for item in ${array[@]}
#do
#menuitems="$menuitems $n \Zb${item}\Zn"
#let n+=1
#done

#dialog --colors --title "Select WIFI connection" --menu \
#"Choose one of the following or press to exit" \
#14 40 6 $menuitems 2> /tmp/file
#if [ $? -gt 0 ]; then
#rm -f /tmp/file
#clear
#echo "Interrupted"
#exit 0
#fi
#selection=${array[$(cat /tmp/file)]}
#echo "Connecting to $selection"
#if [ "$selection" == "Scan_Networks" ]
#then
#urxvt -e sudo wifi-menu
#else 
#netctl start $selection
#fi


# For the use of Rofi
array=( $(ls -p $fileroot | grep -v /) )
n=0
for item in ${array[@]}
do
menuitems="$menuitems${item}\n"
let n+=1
done
menuitems="$menuitems Exit"
echo "$menuitems" > /tmp/fle
selection=$(echo -e $menuitems | rofi -dmenu -i -theme colors-rofi-dark -lines 7 -font "Source\ Code\ Pro 12" -markup-rows -p "Choose network to connect")

if [ "$selection" == "Scan_Networks" ]
then
urxvt -e sudo wifi-menu
elif [ "$selection" == " Exit" ]
then
  exit
else 
netctl start $selection
fi
