#!/usr/bin/env zsh
# path to oh-my-zsh installation.
  export ZSH=$HOME/.omz
POWERLEVEL9K_MODE="nerdfont-complete"
# custom/{plugins,themes}
ZSH_CUSTOM=$ZSH/custom

# factory OMZ settings
ZSH_THEME="powerlevel9k/powerlevel9k"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
# highlighting plugins=(zsh-syntax-highlighting) 
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# plugins
plugins=(
  compleat
  git
  jsontools
  rails
  ruby
  python
  tmux
  zsh-syntax-highlighting
)

# alias
source $HOME/.aliasrc

# rvm
source $HOME/.rvm/scripts/rvm

# OMZ
# source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

autoload -U add-zsh-hook
load-nvmrc() {
	local node_version="$(nvm version)"
	local nvmrc_path="$(nvm_find_nvmrc)"
	
	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

		if [ "$nvmrc_node_version" = "N/A" ]; then
			nvm install
		elif [ "$nvmrc_node_version" != "$node_version" ]; then
			nvm use
		fi
	elif [ "$node_version" != "$(nvm version default)" ]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
	
