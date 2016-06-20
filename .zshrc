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
plugins=(git rails rvm)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Vim
export EDITOR=vim

# RVM

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias ur="unicorn_rails -p 3000"
alias ts="thin start"
alias rr="rake routes"
alias v="vim"
alias gf='gvim'
alias rsp="rails server puma"
alias tlog="tail -f log/test.log"
alias redek="redshift -l 50.1:19.9 -t 5500:3600 -g 0.8 -m vidmode -v"
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
alias sr="spring rspec"

# Ruby GC tuning
# large apps
#export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_FREE_MIN=500000
#export RUBY_HEAP_MIN_SLOTS=40000

# medium and small apps
#export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000
#export RUBY_GC_HEAP_FREE_SLOTS=20000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## RVM stuff
PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

export SPRING_USED=true
export WEB_CONCURRENCY=1
export MAX_THREADS=1

