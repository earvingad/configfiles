#!/bin/bash
#scrot /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
#i3lock -u -i /tmp/screen.png
#rm /tmp/screen.png


IMAGE=/tmp/lockscreen.png
TEXT=/tmp/locktext.png
ICON=/home/earving/.scripts/key-lock.png
ic=/tmp/lock.png
scrot $IMAGE
#convert $IMAGE -scale 10% -scale 1000% -fill black -colorize 25% $IMAGE
convert $IMAGE -blur 0x3 $IMAGE
[ -f $TEXT ] || {
    convert -size 3000x60 xc:white -font /usr/share/fonts/TTF/System\ San\ Francisco\ Display\ Regular.ttf -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $TEXT;
#       convert -size 256x256 xc:white $ic;

convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
#convert $ic -alpha set -channel A -evaluate set 0% $ic;
#convert $ic -font /home/earving/.local/share/fonts/fontawesome-webfont.ttf -pointsize 300 -fill black -gravity center -annotate +0+0 '' $ic;
}
convert $IMAGE $TEXT -gravity center -geometry +0+200 -composite $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -i $IMAGE
rm /tmp/lockscreen.png
rm $TEXT
