#!/bin/bash

case $1 in 

"-p")
  MODE="privateip"
  ;;
"-c")
  MODE="cideteq"
  ;;
esac

case $MODE in

"privateip")
  #cp /etc/privoxy/config_privip_tor /etc/privoxy/config
  #systemctl start tor.service
  #systemctl start privoxy.service
  privoxy --no-daemon /home/earving/.scripts/tor-privoxy/config_privip_tor
  ;;

"cideteq")
  #netctl start POSGRADO1
  #cp /etc/privoxy/config_cideteq_tor /etc/privoxy/config
  systemctl start tor.service
  sh /home/earving/.scripts/tor-privoxy/ec.sh
  privoxy --no-daemon /home/earving/.scripts/tor-privoxy/config_cideteq_tor
  ;;

esac
