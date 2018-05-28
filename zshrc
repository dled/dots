#!/bin/zsh
export ZSH=/home/uu/.omz
 ZSH_THEME="maran"
 DISABLE_AUTO_UPDATE="true"
 DISABLE_AUTO_TITLE="true"
 ENABLE_CORRECTION="true"
 DISABLE_UNTRACKED_FILES_DIRTY="true"
 HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
