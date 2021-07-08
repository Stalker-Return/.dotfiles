#!/bin/bash
# date 01-04-2021, ver.3

if [[ -f ./apps.conf ]]
	then source ./apps.conf;
	else echo -e "\e[1;31mFile doesn't exist ...\e[0m"
		 exit;
fi

# Remove old rabbish
rm -r $HOME/.dotfiles
rm -r $HOME/.config
rm -r $HOME/.local
rm -r $HOME/scripts
rm -r $HOME/bin
rm $HOME/.gitignore
rm $HOME/.bashrc
rm $HOME/README.md
rm $HOME/.xprofile
rm $HOME/.xinitrc
rm $HOME/.fehbg

# Clone dot-files
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/Stalker-Return/.dotfiles.git $HOME/.dotfiles
alias gitbr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
gitbr config status.showUntrackedFiles no
gitbr checkout

sudo chmod +x ~/bin/clean_journal.sh
sudo chmod +x ~/bin/del_cache.sh
sudo chmod +x ~/bin/github_dots.sh
sudo chmod +x ~/bin/github_install.sh
sudo chmod +x ~/bin/github_tools.sh
sudo chmod +x ~/bin/pac_cache.sh
sudo chmod +x ~/bin/sys_update.sh
sudo chmod +x ~/bin/orphan_pack.sh
sudo chmod +x ~/bin/pacman_cache.sh
sudo chmod +x ~/bin/mirrorlist.sh
sudo chmod +x ~/bin/unwanted_dep.sh

systemctl --user enable clean_journal.timer
systemctl --user enable del_cache.timer
systemctl --user enable github_dots.timer
systemctl --user enable github_tools.timer
systemctl --user enable pac_cache.timer
systemctl --user enable sys_update.timer
systemctl --user enable orphan_pack.timer
systemctl --user enable unwanted_dep.timer

# Replace user name
<<COMMENT
grep -rl "/home/ed/" $HOME/ >> ./list.txt

if [[ -f ./list.txt ]]
	then 	filelist='./list.txt';
	else echo "\e[1;31mNothing to do \e[0m";
fi

while read filename
do
	sed -i 's+/home/ed/+/home/test/+g' $filename
done < $filelist
COMMENT

# If openbox, check autostart 
	case $shellinstall in
		"lxde" )
		echo -e "\e[1;93mNothing to do.\e[0m"  && read -t 3
		;;
		"mate" )
		echo -e "\e[1;93mNothing to do.\e[0m"  && read -t 3
		;;
		"xfce" )
		echo -e "\e[1;93mNothing to do.\e[0m"  && read -t 3
		;;
		"openbox" )
		echo -e "\e[1;93mDone! Look at autostart. Press ENTER to continue ...\e[0m"
		read
		nano ~/.config/openbox/autostart
		echo -e "\e[1;93mDone! Look at .xprofile. Press ENTER to continue ...\e[0m"
		read
		nano ~/.xprofile
		;;
		* )
		echo "\e[1;31minvalid option '$shellinstall'. Press ENTER to continue ...\e[0m"
		read
		;;
	esac

# Autogenerate xdg-menu
xdg_menu --format openbox3 --root-menu /etc/xdg/menus/arch-applications.menu > $HOME/.config/openbox/xdg-menu.xml

# Remove rubbish
sudo yes | rm -r /opt/tools
#sudo yes | rm -r $HOME/$dirname
sudo yes | rm $HOME/apps.conf
sudo yes | rm $HOME/list.txt

exit
