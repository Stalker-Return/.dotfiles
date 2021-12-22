#/bash/bin

# A dwm_bar function to print the weather from wttr.in
# Dependencies: curl

HRUBA="48.183141014163375,17.485529092194763"
DRAGO="50.44643534100558,30.3806921419979"
FIRSTPLACE="48.13946831904212,33.571122298465944"
COLBORNE="43.64931014227252,-79.37461428877945"
FUCKTOWN="52.580641910233,39.51437324713422"

mainmenu () { while true
do
  clear
  echo -e ""
  echo "  1) Hrubá Borša, Záhradnícka"
  echo "  2) Kyiv, Petrytskoho"
  echo "  3) Kryvyi Ryh, Uhtomskoho"
  echo "  4) Colborne, Toronto, ON, CA"
  echo "  5) Lipetsk, Stakhanova"
  echo ""
  echo "  x|X) Exit"
  echo -e "\n"
  read -n 1 -r -p "Enter your choice (1-5) or 'X' for exit: " optionA
  case $optionA in
    1)	clear
		echo -e "\n"
		curl -s wttr.in/$HRUBA 
		echo -e "\n"
		read -rsn1 -p "Press any key to continue... "; echo
		;;
    2)	clear
		echo -e "\n"
		curl -s wttr.in/$DRAGO
		echo -e "\n"
		read -rsn1 -p "Press any key to continue... "; echo
		;;
    3)	clear
		echo -e "\n"
		curl -s wttr.in/$FIRSTPLACE
		echo -e "\n"
		read -rsn1 -p "Press any key to continue... "; echo
		;;
    4)	clear
		echo -e "\n"
		curl -s wttr.in/$COLBORNE
		echo -e "\n"
		read -rsn1 -p "Press any key to continue... "; echo
		;;
    5)	clear
		echo -e "\n"
		curl -s wttr.in/$FUCKTOWN
		echo -e "\n"
		read -rsn1 -p "Press any key to continue... "; echo
		;;
    x|X) clear && exit;;
    *)	invalid ;;
  esac
done
}

while getopts :f: opt; do
	case $opt in
		f)	: ;;
		\?)	echo "Invalid option: -$OPTARG" && exit ;;
		:)	echo "Option -$OPTARG requires an argument." && exit ;;
	esac

    case $OPTARG in
		"hruba")
			echo -e "$(curl -s wttr.in/$HRUBA?format=2)"
            ;;
		"petro")
			echo -e "$(curl -s wttr.in/$DRAGO?format=2)"
            ;;
		"firstplace")
			echo -e "$(curl -s wttr.in/$FIRSTPLACE?format=2)"
            ;;
		"colborne")
			echo -e "$(curl -s wttr.in/$COLBORNE?format=2)"
            ;;
		"fucktown")
			echo -e "$(curl -s wttr.in/$FUCKTOWN?format=2)"
            ;;
		"shortlist")
			clear
			echo -e ""
			echo -e ""
			echo -e "            /\                 /\ " 
			echo -e "           / \'._   (\_/)   _.'/ \ "
			echo -e "           |.''._'--(°.°)--'_.''.| "
			echo -e '            \_ / `;=/ " \=;` \ _/ '
			echo -e '              `\__| \___/ |__/` '
			echo -e "                   \(_|_)/ "
			echo -e '                    " ` " '
			echo -e ""
			echo -e ""
			echo -e "  Hrubá Borša, Záhradnícka	" 	"$(curl -s wttr.in/$HRUBA?format=2)"
			echo -e "  Kyiv, Petrytskoho		" 	"$(curl -s wttr.in/$DRAGO?format=2)"
			echo -e "  Kryvyi Ryh, Uhtomskoho	"	"$(curl -s wttr.in/$FIRSTPLACE?format=2)"
			echo -e "  Colborne, Toronto, ON, CA	" "$(curl -s wttr.in/$COLBORNE?format=2)" 
			echo -e "  Lipetsk, Stakhanova		" 	"$(curl -s wttr.in/$FUCKTOWN?format=2)"
			echo -e "\n"
			read -rsn1 -p "  Press any key to continue... "; echo 
            ;;
		"menu")
			mainmenu
			;;
		*) echo "invalid option $OPTARG";;
	esac

done
