#!/bin/sh

# External source
source /home/ed/scripts/external_func.sh
#
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ add .
exitcode1=$?
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ commit -m "Minor Changes"
exitcode2=$?
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ push -u
exitcode3=$?
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ status
exitcode4=$?
#
# log-file record
echo "Github tools has updated: $(date), exit codes:$exitcode1:$exitcode2:$exitcode3:$exitcode4" >> $HOME/.local/share/log-files/github_tools.log
#
# Send notification
notify-send --urgency=critical --expire-time=3000 "Github tools has updated"

exit
