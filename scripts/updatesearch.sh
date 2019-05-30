#!/bin/bash
function pause(){
   read -n 1 -p "$*"
}
bold=$(tput bold)
normal=$(tput sgr0)
txtrst=$(tput sgr0) 
txtblu=$(tput setaf 4) 
case $1 in 

"-u")
  MODE="update"
  ;;
"-s")
  MODE="search"
  ;;
"-i")
  MODE="install"
  ;;
"-w")
  MODE="wifi"
  ;;
esac

case $MODE in

"update")
  yaourt -Syua
  pause "${bold}${txtblu}::${txtrst}${bold} El sistema está actualizado. Presiona una tecla para salir...${normal}"
  echo ""
  ;;

"search")
  echo "${bold}${txtblu}::${txtrst}${bold} ¿Qué deseas buscar?:${normal}"
  read srch
  yaourt -Ss $srch
    while true; do
        read -p "${bold}${txtblu}::${txtrst}${bold} ¿Quieres instalar un programa? [S/n]${normal}" sn
        case $sn in
            [Ss]* ) echo "${bold}${txtblu}::${txtrst}${bold} ¿Cuál es el programa?${normal}"
    read prog
    yaourt -S $prog
    pause "${bold}${txtblu}::${txtrst}${bold} Presiona una tecla para salir...${normal}"
    break;;
          [Nn]* ) exit;;
    * ) echo "${bold}${txtblu}::${txtrst}${bold} Por favor, responde sí o no.${normal}";;
    esac
    done 
  ;;

"install")
  echo "${bold}${txtblu}::${txtrst}${bold} ¿Qué programa deseas instalar?:${normal}"
  read inst
  yaourt -S $inst
  pause "${bold}${txtblu}::${txtrst}${bold} Presiona una tecla para salir...${normal}"
  ;;
"wifi")
  wifi-menu
  pause "${bold}${txtblu}::${txtrst}${bold} Presiona una tecla para salir...${normal}"
  ;;
esac
