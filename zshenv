#!/usr/bin/env zsh
#          _              
#  _______| |__   ___  _ ____    __
# |_  / __| '_ \ / _ \| '_ \ \  / /
#  / /\__ \ | | |  __/| | | \ \/ /
# /___|___/_| |_|\___||_| |_|\__/

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export TERM="screen-256color"
export PAGER="less"
export LESS='-FgiMRSwXz4'
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export PKG_CONFIG_PATH=/usr/local/opt/readline/lib/pkgconfig
export EDITOR='vim'

export LIBZMQ_PATH=$(/usr/local/bin/brew --prefix zeromq)/lib
export LIBCZMQ_PATH=$(/usr/local/bin/brew --prefix czmq)/lib
export JAVA_HOME=/usr/local/opt/openjdk@11
# export JAVA_HOME=$(/usr/libexec/java_home)
export M2_HOME=/usr/local/Cellar/maven/3.6.3_1/libexec
export SCALA_HOME=/usr/local/opt/scala
export SPARK_HOME="/usr/local/Cellar/apache-spark/3.0.0/libexec"

export GOPATH="$HOME/go"

export NPM_PACKAGES=/opt/npm-global

typeset -gU cdpath fpath manpath path
typeset -gUT INFOPATH infopath

cpath=(
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
    /usr/local/aws/bin/aws_completer
    $GOPATH/bin
    $JAVA_HOME/bin
    $M2_HOME/bin
    $SCALA_HOME/bin
    $SPARK_HOME/bin
    $NPM_PACKAGES/bin
    /usr/local/opt/libpq/bin
    /usr/local/mysql/bin
    /usr/local/{bin,sbin}
    /usr/{bin,sbin}
    /{bin,sbin}
)
