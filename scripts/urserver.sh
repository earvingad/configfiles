#!/bin/sh
killall urserver

/home/earving/urserver/urserver --daemon & disown 
#urxvt -e ~/urserver/urserver i
#xdotool search --name "urserver" windowunmap $@ 
