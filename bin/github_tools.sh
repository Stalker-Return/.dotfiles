#!/bin/sh

/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ add .
exitcode1=$?
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ commit -m "Minor Changes"
exitcode2=$?
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ push -u
exitcode3=$?
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ status
exitcode4=$?
echo "github-tools updated: $(date), exit codes:$exitcode1:$exitcode2:$exitcode3:$exitcode4" >> $HOME/.local/share/log-files/github_tools.log
