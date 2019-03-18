#!/bin/bash

case $1 in 

"-l")
	MODE="localhost"
	;;
"-p")
	MODE="privateip"
	;;
esac

case $MODE in

"localhost")
	netctl start INFINITUMduse
	cp /etc/privoxy/config_localhost /etc/privoxy/config
	systemctl start privoxy.service
	;;

"privateip")
	netctl start INFINITUMduse
	cp /etc/privoxy/config_privip /etc/privoxy/config
	systemctl start privoxy.service
	;;
esac

if [ "$MODE" == "localhost" ]
then 
	ip=127.0.0.1
	port=8118
else
	ip=192.168.1.100
	port=8118
fi

#  grep PATH /etc/environment > lol.t;
#  printf \
#  "http_proxy=http://$ip:$port/\n\
#  https_proxy=http://$ip:$port/\n\
#  ftp_proxy=http://$ip:$port/\n\
#  no_proxy=\"localhost,127.0.0.1\"\n\
#  HTTP_PROXY=http://$ip:$port/\n\
#  HTTPS_PROXY=http://$ip:$port/\n\
#  FTP_PROXY=http://$ip:$port/\n\
#  NO_PROXY=\"localhost,127.0.0.1\"\n" >> lol.t;

#  cat lol.t > /etc/environment;

#rm -rf lol.t;