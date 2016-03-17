#!/usr/bin/zsh

autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory extendedhistory

HISTSIZE=1200
SAVEHIST=1200
HISTFILE=~/.zsh.d/.zsh_history

# modern completion system
autoload -Uz compinit
compinit

# local .zshrc
source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
# # Can manage a plugin as a command
# # And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, of:"bin/{histuniq,color}"

# # Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", of:zshrc

# # Prohibit updates to a plugin by using the "frozen:" tag
# zplug "k4rthik/git-cal", as:command, frozen:1

# # Grab binaries from GitHub Releases
# # and rename to use "file:" tag
# zplug "junegunn/fzf-bin", \
#     as:command, \
#     from:gh-r, \
#     file:fzf
# Support oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "themes/duellj", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh

# Group dependencies (i.e., emoji-cli depends on jq)
zplug "stedolan/jq", \
    as:command, \
    file:jq, \
    from:gh-r \
    | zplug "b4b4r07/emoji-cli"

# Check & install plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
zplug load --verbose

# alias
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))' # make -global ?
alias tml='tmux list-sessions'
# bower
alias bower='noglob bower'
# python virtualenv config
# node
# haskell
