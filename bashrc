#!/bin/bash
# bashrc

# vars
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
# sassc
SASS_LIBSASS_PATH="$HOME/.libsass"
SASS_SASSC_PATH="$HOME/.sassc"
SASS_SPEC_PATH="$HOME/.sass-spec"
# export SASS_LIBSASS_PATH SASS_SASSC_PATH SASS_SPEC_PATH
# hacky fix for lessc
export PATH="$NODE_PATH/less/bin:$PATH"

# add to path
# user dir (casper + phantomjs symlinked)
export PATH="$HOME/bin:$PATH"
# node
export PATH="$HOME/$NPM_CONFIG_PREFIX/bin:$PATH"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# shims
eval "$( /app/halcyon/halcyon paths )"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
