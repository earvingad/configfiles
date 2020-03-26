
#Getting the color
for i in {1..16}
do
n=$(($i-1))
color[$n]=$(sed -n "$i,"$i"p" .cache/wal/colors)
done

#echo ${color[1]}

#Writing the color in polybar config file
#make sure "back = $80xxxxxx" is always in line 8
#sed -i "32s/.*/back = #80$bg/" ~/.config/polybar/config

sed -i '5s/.*/gtk-color-scheme = "bg_color:color0\\nfg_color:color15\\nbase_color:color0\\ntext_color:color15\\nselected_bg_color:color5\\nselected_fg_color:color0\\ntooltip_bg_color:color5\\ntooltip_fg_color:color15\\ntitlebar_bg_color:color5\\ntitlebar_fg_color:color15\\nmenubar_bg_color:color8\\nmenubar_fg_color:color15\\ntoolbar_bg_color:color0\\ntoolbar_fg_color:color15\\nmenu_bg_color:color0\\nmenu_fg_color:color15\\npanel_bg_color:color0\\npanel_fg_color:color15\\nlink_color:color5"/' ~/.themes/Ninix-wal/gtk-2.0/gtkrc

sed -i "s/color0/${color[15]}/g" ~/.themes/Ninix-wal/gtk-2.0/gtkrc
sed -i "s/color5/${color[5]}/g" ~/.themes/Ninix-wal/gtk-2.0/gtkrc
sed -i "s/color8/${color[8]}/g" ~/.themes/Ninix-wal/gtk-2.0/gtkrc
sed -i "s/color15/${color[0]}/g" ~/.themes/Ninix-wal/gtk-2.0/gtkrc

cp /home/earving/.cache/wal/gtk.css /home/earving/.themes/Ninix-wal/gtk-3.20/gtk.css
