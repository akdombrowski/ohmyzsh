#!/usr/bin/env bash

# Customizations to .zshrc file
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin${PATH:+":$PATH"}
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:$SCRIPTZ${PATH:+":$PATH"}"

# opencode
export PATH="$PATH:$HOME/.opencode/bin"


# load environment variables
source "$ZSH_CUSTOM/env_vars/common_vars.zsh"

# shared config
source "$ALIASEZ"/common_aliases.zsh

# Source all .zsh files in $ZSH_FUNS
for f in "$ZSH_FUNS"/*.zsh; do
  [ -e "$f" ] && . "$f"
done

# platform-specific
# adds things like aliases and paths specific to the platform
if [[ ${OS} =~ "WSL" ]]; then
  source "$OS_SPECIFIC_CONFIG_DIR/win_wsl.zsh"

elif [[ ${OS} =~ "[lL]inux" ]]; then
  source "$OS_SPECIFIC_CONFIG_DIR/ubu.zsh"
  # all functions
  source "$ZSH_CUSTOM"/funs/*
elif [[ ${OS} =~ "[dD]arwin" ]]; then
  source "$OS_SPECIFIC_CONFIG_DIR/macos.zsh"
else
  source "$OS_SPECIFIC_CONFIG_DIR/win_wsl.zsh"
fi

# autostart ssh
# source "$SCRIPTZ/init-ssh.zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="adombrowski"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
# plugins=(docker common-aliases command-not-found colored-man-pages)
plugins=(common-aliases command-not-found colored-man-pages)

export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/workspace"
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# if the file doesn't exist, create ssh rc file
# TODO: do I need to source it afterwards?
if [ ! -f "$HOME/.ssh/rc" ]; then
	cat "${SCRIPTZ}/init-ssh.zsh" > "$HOME/.ssh/rc"
fi

# Connect to Shared Folders
# Create mounts for LennyDesk if not already mounted
# source "$SCRIPTZ/smbMounts.zsh"


# anaconda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/akdombrowski/workspace/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/akdombrowski/workspace/anaconda3/etc/profile.d/conda.zsh" ]; then
    . "/home/akdombrowski/workspace/anaconda3/etc/profile.d/conda.zsh"
  else
    export PATH="$PATH:/home/akdombrowski/workspace/anaconda3/bin"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# mini-forge
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
