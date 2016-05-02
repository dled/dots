#!/bin/zsh
#          _              
#  _______| |__   ___  _ ____    __
# |_  / __| '_ \ / _ \| '_ \ \  / /
#  / /\__ \ | | |  __/| | | \ \/ /
# /___|___/_| |_|\___||_| |_|\__/
#
#if [[ -d "${ZDOTDIR:-$HOME}/.zplug" ]]; then
#	. "${ZDOTDIR:-$HOME}/.zplug/zplug"
#fi



export HISTFILE="$HOME/.zsh_history"
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=50000
export HISTFILESIZE=50000

#export EMACS="emacsclient -qa"
export EDITOR="nano"
export VISUAL='vim'
export PAGER='less'
export LESS='-FgiMRSwXz4'

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'

export PYENV_ROOT="$HOME/.pyenv"
#eval "$( pyenv init - )"
#eval "$( rbenv init - )"

export GOROOT='/usr/lib/go'
export GOPATH="$HOME/go"

typeset -gU cdpath fpath manpath path
typeset -gUT INFOPATH infopath

cpath=(
    $HOME/.repos
    $cdpath
)

#fpath=(
#    $HOME/.zsh/completion
#    $fpath
#)

infopath=(
    $HOME/.linuxbrew/share/info
    /usr/local/share/info
    /usr/share/info
    $infopath
)

manpath=(
    $HOME/.linuxbrew/share/man
    /usr/local/share/man/
    /usr/share/man/
    $manpath
)

path=(
    $HOME/.npm-global/bin
    $GOPATH/bin
    $PYENV_ROOT/{bin,shims}
    $HOME/.rbenv/{bin,shims}
    $HOME/.linuxbrew/bin
    $MAVEN_HOME/bin
    $JAVA_HOME/bin
    $HOME/{bin,sbin}
    $HOME/.local/{bin,sbin}
    /usr/local/{bin,sbin}
    /usr/{bin,sbin}
    /{bin,sbin}
)

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

