#!/usr/bin/env bash

export PATH="$PATH:$HOME/.local"
# export PATH="$PATH:bin"

export DEFAULT_USERNAME="akdombrowski"
export DEFAULT_USER="akdombrowski"

# put TABSIZE=0 in your environment, to tell `ls` to align using spaces, not tabs.
export TABSIZE=0

export OS="$(uname -sro)"
export OS_SPECIFIC_CONFIG_DIR="$ZSH_CUSTOM/os-specific-config"
export ENV_VARS_DIR="$ZSH_CUSTOM/env_vars"

export ZSH_ALIASES="$ZSH_CUSTOM/aliases"
export ZSH_FUNS="$ZSH_CUSTOM/funs"
export ZSH_SCRIPTS="$ZSH_CUSTOM/scripts"
export FUNZ="$ZSH_CUSTOM/funs"
export SCRIPTZ="$ZSH_CUSTOM/scripts"
export ALIASEZ="$ZSH_CUSTOM/aliases"

# export ZSH_CUSTOM

export WSL_ALIASES="wsl_aliases"
export WIN_ALIASES="win_aliases"
export MACOS_ALIASES="macos_aliases"

# ip of desktop
export LENNYDESK='15'
