#!/usr/bin/zsh
#          _              
#  _______| |__   ___  _ ____    __
# |_  / __| '_ \ / _ \| '_ \ \  / /
#  / /\__ \ | | |  __/| | | \ \/ /
# /___|___/_| |_|\___||_| |_|\__/

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

export HISTFILE="$HOME/.zsh_history"
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=10000
export HISTFILESIZE=50000

export EDITOR="nano"
export VISUAL="vim"
export PAGER="less"
export LESS='-FgiMRSwXz4'

export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

if [ -n $SSH_CONNECTION ]; then
  export EDITOR='vim'
else
  export EDITOR='emacs'
fi

#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

typeset -gU cdpath fpath manpath path
typeset -gUT INFOPATH infopath

cpath=(
    $HOME/.repos
    $cdpath
)

fpath=(
    $HOME/.zsh/completion
    $fpath
)

infopath=(
    /usr/local/share/info
    /usr/share/info
    $infopath
)

manpath=(
    /usr/local/share/man/
    /usr/share/man/
    $manpath
)

path=(
    $HOME/.npm-global/bin
    $PYENV_ROOT/{bin,shims}
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

