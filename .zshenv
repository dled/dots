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

export EMACs="emacsclient -qa"

export HISTFILE="$HOME/.zsh_history"
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=25000
export HISTFILESIZE=50000

#export EMACS="emacsclient -qa"
export EMACS="/usr/bin/emacs"
export EDITOR="$EMACS"
export VISUAL='vim'
export PAGER='less'
export LESS='-FgiMRSwXz4'

# should this be tethered?
#export PYENV_ROOT='$HOME/.pyenv'
export NPM_CONFIG_PREFIX='~/.npm-global'

# typeset -gU(T?) home?
typeset -gU cdpath fpath manpath path
typeset -gUT INFOPATH infopath

cpath=(
    $HOME/.repos
    $cdpath
)

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


#   $HOME/{.rbenv,.pyenv}/{shims,bin} ?
path=(
    $HOME/{bin,sbin}
    $NPM_CONFIG_PREFIX/bin
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

