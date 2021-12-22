[The best detailed explanation](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained) :+1:
<br/>
**Setup GIT config**<br/>
git config --global user.email "eduard.babyshenko@google.com"<br/>
git config --global user.name "Stalker-Return"<br/>
<br/>
**Arrange Git repository**<br/>
git init --bare $HOME/.dotfiles<br/>
alias gitstor='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'<br/>
gitstor config status.showUntrackedFiles no<br/>
gitstor remote add origin git@github.com:Stalker-Return/.dotfiles.git<br/>
**Or only update, if the errorr "fatal: remote origin already exists", ocured:** <br/>
gitstor remote set-url origin git@github.com:Stalker-Return/.dotfiles.git<br/>
<br/>
<br/>
**Add alias to .bashrc if necessary**<br/>
echo "alias gitstor='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc<br/>
**Reset remote url if necessary**<br/>
gitstor remote set-url origin git@gitlab.com:Stalker.Return/dotfiles.git<br/>
<br/>
**Add, commit and push to the remote**<br/>
gitstor status<br/>
gitstor add .bashrc<br/>
gitstor commit -m "Added bashrc"<br/>
gitstor push -u<br/>
**For the first time**<br/>
gitstor push --set-upstream origin master <br/>
<br/>
**[Install](https://www.atlassian.com/git/tutorials/dotfiles<br/>) your dotfiles onto a new system (or migrate to this setup):**<br/>
**Run the [script](https://github.com/Stalker-Return/.dotfiles/blob/master/scripts/fucking_dangerouse_script.sh) to back up the files**<br/>
echo ".dotfiles" >> .gitignore<br/>
git clone --bare https://github.com/Stalker-Return/.dotfiles.git $HOME/.dotfiles<br/>
alias gitstor='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'<br/>
gitstor config status.showUntrackedFiles no<br/>
gitstor checkout<br/>
