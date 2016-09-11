# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="terminalparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='ls -al'
alias more='less -R'
alias vi='vim'
alias l1='ls -1'
alias time='\time -p'
alias cdp='cd -P'
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"



# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#fpath=(~/.zsh/completion $fpath)
plugins=(go brew httpie osx vagrant colored-man)

mkcd() {
	mkdir "$1" && cd "$1"
}

[[ -s "$HOME/.zshrc_custom" ]] && . "$HOME/.zshrc_custom"
source $ZSH/oh-my-zsh.sh
autoload -U zmv
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} x%{$fg[yellow]%}"

unsetopt autopushd
# Customize to your needs...
export PATH=~/bin:/usr/local/bin:$PATH
#export PATH=~/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin


zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' menu select=0

zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu yes select

