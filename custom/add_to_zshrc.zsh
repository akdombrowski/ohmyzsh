# Customizations to .zshrc file

# source functions
source "$HOME/.oh-my-zsh/custom/funs/kmNameRND.zsh"

# rather than adding stuff to the .zshrc file in the home dir which isnt being syncd with git
# this file is read by oh-my-zsh.sh
# can add what you would've put into ~/.zshrc like path variables

export PATH="$PATH:$HOME/.local/bin:/sbin:/usr/sbin"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nano'
# else
#   export EDITOR='nano'
# fi
export EDITOR='nano'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# corepack enable && yarn set version stable --only-if-needed

# export PATH="$PATH:$HOME/dart-sass"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/adombrowski/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
# if [ $? -eq 0 ]; then
#  eval "$__conda_setup"
# else
#  if [ -f "/home/adombrowski/anaconda3/etc/profile.d/conda.sh" ]; then
#    . "/home/adombrowski/anaconda3/etc/profile.d/conda.sh"
#  else
#    export PATH="$PATH:/home/adombrowski/anaconda3/bin"
#  fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(\"$HOME\"'/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="$PATH:$HOME/miniconda3/bin"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<
# export PATH="$PATH:$HOME/miniconda3/bin"

# Also gets set in ~/.condarc
# conda config --set auto_activate_base True
# conda config --set auto_activate_base False
# export PATH="$PATH:/usr/local/cuda-12.5/bin"

# export PATH="$PATH:$(yarn global bin)"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PATH:$PNPM_HOME" ;;
esac
# pnpm end

# Java
# export JAVA_HOME="/usr/java/jdk-22-oracle-x64"

export DEFAULT_USERNAME="akdombrowski"
export DEFAULT_USER="akdombrowski"

# watchman bin
# export PATH="$PATH:$HOME/watchman-v2024.04.08.00-linux/bin"

# export PATH="~/jdk-22.0.1/bin:$PATH"

# export ANDROID_HOME="/mnt/a/akdfl/android_studio/android-sdk"
# export PATH="$PATH:$ANDROID_HOME/emulator"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="$PATH:$HOME/.console-ninja/.bin"

# Add Go to Path
# export PATH="$PATH:/usr/local/go/bin"

# put TABSIZE=0 in your environment, to tell `ls` to align using spaces, not tabs.
export TABSIZE=0

export OS="$(uname -sro)"
export ALIASES_DIR="$ZSH/custom/aliases"
export OS_SPECIFIC_CONFIG_DIR="$ZSH/custom/os-specific-config"

# shared config
source $ALIASES_DIR/common_aliases.zsh

# platform-specific
# adds things like aliases and paths specific to the platform
if [[ ${OS} =~ "[lL]inux" ]]; then
  source "$OS_SPECIFIC_CONFIG_DIR/ubu.zshrc"
else
  source "$OS_SPECIFIC_CONFIG_DIR/win_wsl.zshrc"
fi
