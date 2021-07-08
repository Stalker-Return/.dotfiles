#!/bin/sh

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add \
.bashrc .xprofile .xinitrc .fehbg README.md scripts/ bin/ Templates/ \
.local/share/icons/ .local/share/log-files/ .local/share/wallpapers/ .local/share/applications/ \
.config/mimeapps.list .config/pavucontrol.ini \
.config/geany/ .config/gtk-2.0/ .config/gtk-3.0/ .config/lxterminal/ .config/libreoffice/ .config/pulse/ \
.config/lxpanel/ .config/lxsession/ .config/dunst/ .config/doublecmd/ .config/conky/ .config/nyxt/ \
.config/systemd/ .config/tint2/ .config/powerkit/ .config/openbox/ .config/pcmanfm/ .config/alacritty/ \
.config/Thunar/ .config/FreeFileSync/
exitcode1=$?
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Dayly upload"
exitcode2=$?
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push -u
exitcode3=$?
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status
exitcode4=$?
echo "github-tools updated: $(date), exit codes:$exitcode1:$exitcode2:$exitcode3:$exitcode4" >> $HOME/.local/share/log-files/github_dots.log
