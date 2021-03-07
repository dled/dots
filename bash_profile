# .bash_profile
# added by Miniconda3 4.7.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/dylanledbetter/opt/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/dylanledbetter/opt/miniconda3/etc/profile.d/conda.sh" ]; then
# . "/Users/dylanledbetter/opt/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/dylanledbetter/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dylanledbetter/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dylanledbetter/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/dylanledbetter/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dylanledbetter/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
