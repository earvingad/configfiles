#!/bin/bash

confirm() {
    # echo -e "Yes\nNo" | rofi -dmenu -i -theme colors-rofi-dark -lines 7 -font "Source\ Code\ Pro 12" -format d -selected-row 0 -p "${1:-Confirm}"
    echo -e "Yes\nNo" | rofi -dmenu -i -theme simple -lines 7 -format d -selected-row 0 -p "${1:-Confirm}"
}

shutdown="Shutdown"
reboot="Reboot"
quit="Quit bspwm"
reload="Reload sxhkd configuration"
restartpan="Restart panel"
quitpan="Quit panel"
suspend="Suspend"


content="$shutdown\n$reboot\n$quit\n$suspend\n$reload\n$restartpan\n$quitpan"

# selection=$(echo -e $content | rofi -dmenu -i -theme colors-rofi-dark -lines 7 -font "Source\ Code\ Pro 12" -markup-rows -p "Action")
selection=$(echo -e $content | rofi -dmenu -i -theme simple -lines 7 -markup-rows -p "Action")
case $selection in
    $reload)
        pkill -USR1 -x sxhkd ;;
    $restartpan)
        ~/.scripts/bgpolytranp.sh & ;;
    $quitpan)
        pkill panel ; pkill trayer ; bspc config top_padding 0 ;;
    $quit)
        [[ $(confirm) = 1 ]] && (pkill panel ; pkill trayer ; (for win in $(bspc query -N); do bspc node $win -c ; done;) ; bspc quit) ;;
    $suspend)
        [[ $(confirm) = 1 ]] && (systemctl suspend -i) ;;
    $reboot)
        [[ $(confirm) = 1 ]] && (systemctl reboot -i) ;;
    $shutdown)
        [[ $(confirm) = 1 ]] && (systemctl poweroff -i) ;;
esac

