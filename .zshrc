[ -f ~/.zsh_profile ] && source ~/.zsh_profile

# If you come from bash you might have to change your $PATH.
export PATH="~/bin:/usr/local/sbin:$PATH"
export PATH=$HOME/Library/Android/sdk/build-tools/28.0.3:$HOME/bin:$HOME/.bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

export CPLUS_INCLUDE_PATH=/opt/homebrew/include

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export LC_ALL="en_US.UTF-8"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# if [ "$(uname)" = "Darwin" ]; then
  ZSH_THEME="robbyrussell"
# else
#   ZSH_THEME="agnoster"
# fi

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh" --no-use  # This loads nvm
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  plugins=(
    git
    history
    history-substring-search
    brew
    rails
    rake
    bundler
    docker
    ssh-agent
    vi-mode
  )
else
  plugins=(
    git
    history
    history-substring-search
    node
    ssh-agent
    vi-mode
  )
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


if [ "$(uname)" = "Darwin" ]; then
  eval "$(rbenv init -)"
fi

export EDITOR="vim -f"
export VISUAL="$EDITOR"

alias grep="grep --color=auto"
alias lss="ls -laGFh"

alias be="bundle exec"
alias brt="bundle exec rails test"

alias e="vim"

alias zshconfig="e ~/.zshrc"
alias ohmyzsh="e ~/.oh-my-zsh"
alias src="omz reload"

alias ggprune='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add local bin directory to path for easy access
export PATH=./bin:$PATH

export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='ag --ignore node_modules -i -f -g ""'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

if [ -f '/usr/local/opt/google-cloud-sdk/path.zsh.inc' ]; then
  source /usr/local/opt/google-cloud-sdk/path.zsh.inc
fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON=/opt/homebrew/bin/python3.12

NVM_DIRTY=false

# node() {
#   if [[ -f ".nvmrc" ]]; then
#     nvm use --silent
#     NVM_DIRTY=true
# 
#     $(nvm which --silent) $@
#   elif [[ $NVM_DIRTY = true ]]; then
#     nvm use default
#     NVM_DIRTY=false
# 
#     $(nvm which node) $@
#   else
#     $(nvm which node) $@
#   fi
# }

eval "$(mise activate zsh)"
