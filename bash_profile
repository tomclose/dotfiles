eval "$(rbenv init -)"

export NVM_DIR=~/.nvm

export PS1='\[\033[1;34m\]\w\[\033[1;37m\] \n$ '

alias ocl='cd ~/Documents/Coding/ocl/MT2013'
alias be='bundle exec'

alias gd='git diff'
alias gdc='git diff --cached'
alias grom='git rebase origin/master'
alias gchom='git checkout master'
alias gmnff='git merge --no-ff'
alias gc='git checkout'
alias gs='git status'
#prune merged git branches; prune remote tracking (remove ones where remote has been removed)
alias gp='git branch --merged master | egrep -v "(^\*|master|dev)" | xargs -n 1 git branch -d; git remote prune origin'
# recent activity. Modified from http://stackoverflow.com/a/2514279
alias ga='for branch in `git for-each-ref --format="%(refname:strip=2)" refs/heads`;do echo -e `git log -1 --format="%cd, %cr:" --date=short ${branch#"* "}` \\t${branch#"* "}; done | sort -r'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias erc='vim ~/.bash_profile'
alias src='source ~/.bash_profile'

alias gpp='git push && git push production'
alias hrcp='heroku run rails c --remote production'
alias hrcs='heroku run rails c --remote staging'
alias rtp='rake db:migrate && rake db:test:prepare && spring stop'

alias hglt='highlight -O rtf --font-size 24 --font Courier --style solarized-dark --src-lang ruby'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by Anaconda 2.3.0 installer
export PATH="/Users/tomclose/anaconda/bin:$PATH"

# known security risk!
export PATH="./bin:$PATH"
