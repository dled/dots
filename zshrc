#!/usr/bin/zsh
ZDOTDIR=$HOME
ZSH=$ZDOTDIR/.omz

# tmux plugin
# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOCONNECT="true"

# factory OMZ settings
ZSH_THEME="powerlevel9k/powerlevel9k"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# custom/{plugins,themes}
ZSH_CUSTOM=$ZSH/custom

# plugins
plugins=(
  compleat
  git
  gem
  tmux
  zsh-syntax-highlighting
)

# alias
source /opt/dotenv/aliasrc

# pager
source /opt/dotenv/lessopts

# OMZ
source $ZSH/oh-my-zsh.sh

# rvm
source /opt/rvm/scripts/rvm

# nvm
# export NVM_DIR="/opt/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"
# 
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

