#!/usr/bin/zsh
#          _              
#  _______| |__   ___  _ ____    __
# |_  / __| '_ \ / _ \| '_ \ \  / /
#  / /\__ \ | | |  __/| | | \ \/ /
# /___|___/_| |_|\___||_| |_|\__/

export ZDOTDIR="$HOME"
export ZSH="$ZDOTDIR/.omz"

export PGDATA=/usr/local/pgsql/data
export VIMRUNTIME=/usr/share/vim/vim80

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export TERM="screen-256color"
export PAGER="less"
export LESS='-FgiMRSwXz4'
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export JAVA_HOME=/opt/java/64/jdk-10.0.2
# export M2_HOME=/opt/maven/apache-maven-3.5.3

typeset -gU cdpath fpath manpath path
typeset -gUT INFOPATH infopath

cpath=(
    $cdpath
)

fpath=(
    $ZSH/{functions,completion}
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
    $HOME/{bin,sbin}
    $HOME/.local/{bin,sbin}
    /usr/local/{bin,sbin}
    /usr/{bin,sbin}
    /{bin,sbin}
    $JAVA_HOME/bin
    /usr/local/pgsql/bin
)
