#!/usr/bin/env sh

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi


#if [ -n "$BASH_VERSION" ]; then
#    if [ -f "$HOME/.bashrc" ]; then
#        . "$HOME/.bashrc"
#    fi
#fi

#export PATH=/usr/local/bin:$PATH

#if [ -d "$HOME/.local/bin" ] ; then
#	PATH="$HOME/.local/bin:$PATH"
#fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi

