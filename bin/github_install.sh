#!/bin/sh

/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ add .
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ commit -m "Minor Changes"
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ push -u
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ status
echo "github-tools updated: $(date)" >> $HOME/.local/share/log-files/install.log
