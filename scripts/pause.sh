#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
txtrst=$(tput sgr0) 
txtblu=$(tput setaf 4) 
function pause(){
   read -n1 -p "$*"
}
echo "${bold}${txtblu}::${txtrst}${bold} Puntos de acceso activos:${normal}"
create_ap --list-running
pause "${bold}Presiona una tecla para salir...${normal}"
