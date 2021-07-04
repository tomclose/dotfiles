# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(rbenv init -)"

# Path to your oh-my-zsh installation.
export ZSH=/Users/tomclose/.oh-my-zsh


ZSH_THEME="avit"

# klab settings
export KLAB_EVMS_PATH=/Users/tomclose/magmo/kframework/klab/evm-semantics



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
alias hrcp='heroku run rails c -r prod'
alias hrcd='heroku run rails c -r demo'
alias hrcs='heroku run rails c --remote staging'
alias rtp='rake db:migrate && rake db:test:prepare && spring stop'

alias hglt='highlight -O rtf --font-size 24 --font Courier --style solarized-dark --src-lang ruby'

# docker compose shortcut e.g. `d rspec` or `d rails s`
alias d='docker-compose run --rm app $*'

alias be='bundle exec'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/tomclose/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/tomclose/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tomclose/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/tomclose/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# added by rustup
export PATH="$HOME/.cargo/bin:$PATH"

# known security risk!
export PATH="./bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export HUSKY_SKIP_HOOKS=1


. /usr/local/opt/asdf/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
