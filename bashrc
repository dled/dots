#!/bin/bash
# bashrc
SRC=~/src
# vars
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
# GHC + cabal
# export PATH="/opt/cabal/1.22/bin:/opt/ghc/7.10.1/bin:$PATH"

# add to path
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$SRC/apache-maven-3.3.9/bin:$PATH"
# user dir (casper + phantomjs symlinked)
export PATH="$HOME/bin:$PATH"
# node
export PATH="$HOME/.npm-global/bin:$PATH"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

# shims
eval "$( /app/halcyon/halcyon paths )"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
#!/bin/bash
# bashrc

# vars
EDITOR="emacsclient -qa"
VISUAL="vim"
PAGER=less
LESS=FRmeiX
export EDITOR VISUAL PAGER LESS

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
# GHC + cabal
# export PATH="/opt/cabal/1.22/bin:/opt/ghc/7.10.1/bin:$PATH"
# Halcyon
export HALCYON_GHC_VERSION=7.10.1
export HALCYON_CABAL_VERSION=1.22.6.0
# node
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export NODE_PATH="$NPM_CONFIG_PREFIX/lib/node_modules"
# Heroku toolbelt @ /usr/local/heroku/bin
# export PATH="/usr/local/heroku/bin:$PATH"
# TODO: ln -s /usr/local/heroku/bin/?? ~bin

# sassc
SASS_LIBSASS_PATH="$HOME/.libsass"
SASS_SASSC_PATH="$HOME/.sassc"
SASS_SPEC_PATH="$HOME/.sass-spec"
# export SASS_LIBSASS_PATH SASS_SASSC_PATH SASS_SPEC_PATH
# hacky fix for lessc
# export PATH="$NODE_PATH/less/bin:$PATH"

# add to path
# brew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# user dir (casper + phantomjs symlinked)
export PATH="$HOME/bin:$PATH"
# brew
# node
# export PATH="$HOME/$NPM_CONFIG_PREFIX/bin:$PATH"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# shims
eval "$( /app/halcyon/halcyon paths )"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
