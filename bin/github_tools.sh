#!/bin/sh

/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ add .
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ commit -m "Minor Changes"
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ push -u
/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/tools/ status
echo "github-tools updated: $(date)" >> $HOME/.local/share/log-files/github_tools.log
