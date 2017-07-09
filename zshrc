# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(rbenv init -)"

# Path to your oh-my-zsh installation.
export ZSH=/Users/tomclose/.oh-my-zsh

ZSH_THEME="avit"





plugins=(git)

source $ZSH/oh-my-zsh.sh

# include z
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

alias erc='vim ~/.zshrc'
alias src='source ~/.zshrc'

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
