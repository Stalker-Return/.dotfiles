#!/bin/sh

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add \
.bashrc .xprofile .xinitrc .fehbg README.md scripts/ bin/ \
.local/share/icons/ .local/share/log-files/ .local/share/wallpapers/ .local/share/applications/ \
.config/mimeapps.list .config/pavucontrol.ini \
.config/geany/ .config/gtk-2.0/ .config/gtk-3.0/ .config/lxterminal/ .config/libreoffice/ .config/pulse/ \
.config/lxpanel/ .config/lxsession/ .config/dunst/ .config/doublecmd/ .config/conky/ .config/nyxt/ \
.config/systemd/ .config/tint2/ .config/powerkit/ .config/openbox/ .config/pcmanfm/ .config/alacritty/ \
.config/Thunar/ .config/FreeFileSync/

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Initial upload"
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push -u
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status
echo "github-tools updated: $(date)" >> $HOME/.local/share/log-files/github_dots.log
