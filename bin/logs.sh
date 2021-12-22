#!/bin/bash
xterm -bg black -fg white -T Log_Files -geometry 125x20+265+1 -e 'tput civis; \
echo -e ""; \
echo -e "Outcome of the last user services start."; \
echo -ne "\n"; \
echo -e "\e[0;32mDaily Services\e[0;37m"; echo -ne; \
echo -e "\e[0;32msys_update:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/sys_update.log); echo -ne; \
echo -e "\e[0;32maur_update:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/aur_update.log); echo -ne; \
echo -e "\e[0;32mdel_cache:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/del_cache.log); echo -ne; \
echo -e "\e[0;32mdot_files:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/github_dots.log); echo -ne; \
echo -e "\e[0;32mgit_tools:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/github_tools.log); \
echo -ne "\n"; \
echo -e "\e[0;34mWeekly Services\e[0;37m"; echo -ne; \
echo -e "\e[0;34mpac_cache:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/pac_cache.log); echo -ne; \
echo -e "\e[0;34morphan_pac:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/orphan_pac.log); echo -ne; \
echo -e "\e[0;34munwanted_dep:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/unwanted_dep.log); echo -ne; \
echo -e "\e[0;34mclean_journal:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/clean_journal.log); echo -ne; \
echo -e "\e[0;34mmirror list:\e[0;37m" "\t" $(tail -1 $HOME/.local/share/log-files/mirrorlist.log); echo -ne "\n"; \
echo -e ""; \
echo -e "\033[5mPress any key to exit...\033[0m"; \
read -rsn1'
