#!/usr/bin/env bash

# Aliases
source "$ALIASEZ/macos_aliases.zsh"

# Environment Variables
source "$ENV_VARS_DIR/macos_vars.zsh"

# anaconda
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/akdombrowski/workspace/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
# if [ $? -eq 0 ]; then
#   eval "$__conda_setup"
# else
#   if [ -f "/home/akdombrowski/workspace/anaconda3/etc/profile.d/conda.zsh" ]; then
#     . "/home/akdombrowski/workspace/anaconda3/etc/profile.d/conda.zsh"
#   else
#     export PATH="$PATH:/home/akdombrowski/workspace/anaconda3/bin"
#   fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# # mini-forge
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/akdombrowski/workspace/miniforge3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
# if [ $? -eq 0 ]; then
#   eval "$__conda_setup"
# else
#   if [ -f "/home/akdombrowski/workspace/miniforge3/etc/profile.d/conda.zsh" ]; then
#     . "/home/akdombrowski/workspace/miniforge3/etc/profile.d/conda.zsh"
#   else
#     export PATH="$PATH:/home/akdombrowski/workspace/miniforge3/bin"
#   fi
# fi
# unset __conda_setup

# if [ -f "/home/akdombrowski/workspace/miniforge3/etc/profile.d/mamba.zsh" ]; then
#   . "/home/akdombrowski/workspace/miniforge3/etc/profile.d/mamba.zsh"
# fi
# # <<< conda initialize <<<

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# perl
PATH="${PATH:+${PATH}}:/$HOME/perl5/bin"
export PATH
PERL5LIB="/$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/$HOME/perl5\""
export PERL_MB_OPT

# PERL_MM_OPT="INSTALL_BASE=/$HOME/perl5"
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib
export PERL_MM_OPT
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

export PATH="${PATH}:$HOME/Library/Python/3.9/bin"

# # set fast mouse speed
# setErgoFast
