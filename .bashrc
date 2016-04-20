#!/bin/bash
# bashrc
export SRC=~/src
EDITOR="emacs"
VISUAL="vim"
PAGER="less"
LESS='-FgiMRSwXz4'
export EDITOR VISUAL PAGER LESS

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$SRC/apache-maven-3.3.9/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

export GOROOT="$HOME/go"
export PATH="$PATH:$GOROOT/bin"

export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

export PATH="$HOME/bin:$PATH"

# sassc
#SASS_LIBSASS_PATH="$HOME/.libsass"
#SASS_SASSC_PATH="$HOME/.sassc"
#SASS_SPEC_PATH="$HOME/.sass-spec"
# export SASS_LIBSASS_PATH SASS_SASSC_PATH SASS_SPEC_PATH
# export PATH="$NODE_PATH/less/bin:$PATH"

# shims
#eval "$( /app/halcyon/halcyon paths )"
eval "$( rbenv init - )"
eval "$( pyenv init - )"
