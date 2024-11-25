#!/bin/zsh

# PATH env var
export PATH="$PATH:$HOME/.local"
# export PATH="$PATH:bin"

export DEFAULT_USERNAME="akdombrowski"
export DEFAULT_USER="akdombrowski"

# put TABSIZE=0 in your environment, to tell `ls` to align using spaces, not tabs.
export TABSIZE=0

export OS="$(uname -sro)"
export ALIASES_DIR="$ZSH/custom/aliases"
export OS_SPECIFIC_CONFIG_DIR="$ZSH/custom/os-specific-config"
export ENV_VARS_DIR="$ZSH/custom/env_vars"

export ZSH_CUSTOM
