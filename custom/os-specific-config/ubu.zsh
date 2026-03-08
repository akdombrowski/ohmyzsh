#!/usr/bin/env bash

# Aliases
source "$ALIASEZ/mint_aliases.zsh"

# Environment Variables
source "$ENV_VARS_DIR/mint_vars.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.zsh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# perl
PATH="${PATH:+${PATH}}:/home/akdombrowski/perl5/bin"
export PATH
PERL5LIB="/home/akdombrowski/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/akdombrowski/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/akdombrowski/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/akdombrowski/perl5"
export PERL_MM_OPT

# # set fast mouse speed
# setErgoFast
