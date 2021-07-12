#!/bin/bash
#
clear
echo  -e "\033[5mСopying the 'Clouds'-folder\033[0m"
rsync -ar --delete /home/ed/Clouds "/run/media/ed/TOSHIBA EXT"
echo "Done"
clear
echo  -e "\033[5mСopying the 'Musics'-folder\033[0m"
rsync -ar --delete /home/ed/Musics "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/garbage"
echo "Done"
clear
echo  -e "\033[5mСopying the 'Pictures'-folder\033[0m"
rsync -ar --delete /home/ed/Pictures "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/garbage"
echo "Done"
clear
echo  -e "\033[5mСopying the 'Documents'-folder\033[0m"
rsync -ar --delete /home/ed/Documents "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/garbage"
echo "Done"
clear
echo  -e "\033[5mСopying the 'Downloads'-folder\033[0m"
rsync -ar --delete /home/ed/Downloads "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/garbage"
echo "Done"
clear
echo  -e "\033[5mСopying the 'scripts'-folder\033[0m"
rsync -ar --delete /home/ed/scripts "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the 'bin'-folder\033[0m"
rsync -ar --delete /home/ed/bin "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the 'Templates'-folder\033[0m"
rsync -ar --delete /home/ed/Templates "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the '.local'-folder\033[0m"
rsync -ar --delete /home/ed/.local "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the '.config'-folder\033[0m"
rsync -ar --delete /home/ed/.config "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the 'Clouds'-folder\033[0m"
rsync -ar --delete /home/ed/.bashrc "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the '/xprofile'-file\033[0m"
rsync -ar --delete /home/ed/.xprofile "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the '.xinitrc'-file\033[0m"
rsync -ar --delete /home/ed/.xinitrc "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the '.fehbg'-file\033[0m"
rsync -ar --delete /home/ed/.fehbg "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
echo  -e "\033[5mСopying the 'README.md'-file\033[0m"
rsync -ar --delete /home/ed/README.md "/run/media/ed/TOSHIBA EXT/Storage/Linux/Arch Linux/openbox"
echo "Done"
clear
read -rsn1 -p "Press any key to exit... "; echo
