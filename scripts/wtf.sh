#!/bin/bash
 
while getopts :f: opt; do
  case $opt in
    f)
      echo "argument = $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
  
      case $OPTARG in
        "update")
            yay -Syu --noconfirm
            ;;
        "update-pacman")
            sudo pacman -Syyu
            ;;
        "update-yay")
            yay -Sua --noconfirm
            ;;
        "clean-cache")
            du -sh /var/cache/pacman/pkg/
            ;;
         "remove-cached-packages")
            sudo pacman -Scc
            ;;
         "remove orphaned packages")
            sudo pacman -Rns $(pacman -Qtdq)
            ;;
		 "menu")
		   PS3='Make your choice: '
           choice=("update" "update only pacman" "update only yay" "clean cache" "remove cached packages" "remove orphaned packages" "quit")
           select fav in "${choice[@]}"; do
               case $fav in
                 "update")
                   yay -Syu --noconfirm
                   ;;
                 "update only pacman")
					sudo pacman -Syyu
					;;
				"update only yay")
					yay -Sua --noconfirm
					;;
				"clean cache")
					du -sh /var/cache/pacman/pkg/
					;;
				"remove cached packages")
					sudo pacman -Scc
					;;
				"remove orphaned packages")
					sudo pacman -Rns $(pacman -Qtdq)
					;;
				"quit")
					echo "User requested exit"
					exit
					;;
				*) echo "invalid option $REPLY";;
			  esac
			done
			;;
		*) echo "invalid option $REPLY";;
    esac
  
done
