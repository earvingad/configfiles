#!/bin/bash

case $1 in 

"-m")
	MODE="mount"
	;;
"-u")
	MODE="unmount"
	;;
esac

case $MODE in

"mount")
	mkdir /run/media /run/media/earving /run/media/earving/OS
	mount /dev/sda5 /run/media/earving/OS
	;;

"unmount")
	umount /dev/sda5
	rm -rf /run/media
	;;

esac