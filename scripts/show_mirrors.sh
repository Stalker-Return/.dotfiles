#!/bin/bash
lxterminal -e 'cat /etc/pacman.d/mirrorlist > ~/mirror && nano ~/mirror && rm ~/mirror'
#lxterminal -e 'cat /etc/pacman.d/mirrorlist && echo -e "\n" && echo -e "Press ENTER to exit ..." &&  read'
