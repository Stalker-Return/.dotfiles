#!/bin/sh

# External source
source /home/ed/scripts/external_func.sh
#
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ add .
exitcode1=$?
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ commit -m "Regular Update"
exitcode2=$?
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ push -u
exitcode3=$?
/usr/bin/git --git-dir=$HOME/.git/install/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/install/ status
exitcode4=$?
#
# log-file record
echo "install.git has updated: $(date), exit codes:$exitcode1:$exitcode2:$exitcode3:$exitcode4" >> $HOME/.local/share/log-files/github_install.log
#
# Send notification
notify-send --urgency=critical --expire-time=3000 "install.git has updated"

exit
