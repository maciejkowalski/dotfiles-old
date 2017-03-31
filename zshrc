# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nebirhos" #"robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails rvm osx terminalapp)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:"

# Vim
export EDITOR=vim

# RVM

# tmuxinator
#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias ur="unicorn_rails -p 3000"
alias ts="thin start"
alias rr="rake routes"
alias v="vim"
alias rsp="rails server puma"
alias tlog="tail -f log/test.log"
alias gpc="gp; gp bitbucket; cap deploy"
alias be="bundle exec"
alias berdbm="bundle exec rake db:migrate db:test:prepare"
alias glc="gl --rebase origin master; bundle; berdbm"
alias berg="bundle exec rake db:migrate db:rollback"
alias usedports="sudo netstat -tulpn"
alias occupiedspace="du -ms *|sort -n"
alias c="cd"
alias z="zeus"
alias zr="zeus rspec"
alias l="ls -lAh"
alias gt="git citool"
alias additional-gems-install="gem install zeus git-up tmuxinator fzf"

# Ruby GC tuning
# large apps
#export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_FREE_MIN=500000
#export RUBY_HEAP_MIN_SLOTS=40000

# medium and small apps
# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000
# export RUBY_GC_HEAP_FREE_SLOTS=20000

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#export HOMEBREW_GITHUB_API_TOKEN=852c30ce73e4f6617ae7ba6f8010329d34075873
#


if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
fi


########### GET SHIT DONE STUFF  #### 

PATH=$PATH:$HOME/.get-shit-done # Add RVM to PATH for scripting



############ PYTHON STUFF ##############################




export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

export PATH="$HOME/.bin:$PATH"
