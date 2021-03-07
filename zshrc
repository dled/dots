#!/usr/bin/env zsh
export TERM="xterm-256color"
# path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=`tty`
#autoload bashcompinit && bashcompinit
#complete -C '/usr/local/aws/bin/aws_completer' aws

# source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
# autoload -U promptinit; promptinit
# prompt spaceship
# factory OMZ settings
# ZSH_THEME="spaceship"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# custom/{plugins,themes}
ZSH_CUSTOM=$ZSH/custom

# plugins
plugins=(
  aws
  fzf
  git
  tmux
  colored-man-pages
)

# alias
source $HOME/.aliasrc

# OMZ
source $ZSH/oh-my-zsh.sh

# For a ipython notebook and pyspark integration
if which pyspark > /dev/null; then
  export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
  export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.9-src.zip:$PYTHONPATH
fi

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS=notebook

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/dylanledbetter/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    CONDA_CHANGEPS1=false \eval "$__conda_setup"
else
    if [ -f "/Users/dylanledbetter/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/dylanledbetter/miniconda/etc/profile.d/conda.sh"
        CONDA_CHANGESPS1=false conda activate base
    else
        export PATH="/Users/dylanledbetter/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# starship prompt
eval "$(starship init zsh)"
export SPACESHIP_RUBY_SYMBOL=""
export SPACESHIP_PYTHON_SYMBOL=""
export SPACESHIP_CONDA_SYMBOL=""

unsetopt correct_all

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
