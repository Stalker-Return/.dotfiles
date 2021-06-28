#!/bin/sh

/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ add .
exitcode1=$?
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ commit -m "Regular Update"
exitcode2=$?
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ push -u
exitcode3=$?
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ status
exitcode4=$?
echo "github-install updated: $(date), exit codes:$exitcode1:$exitcode2:$exitcode3:$exitcode4" >> $HOME/.local/share/log-files/github_install.log
