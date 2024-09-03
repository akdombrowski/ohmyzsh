# Customizations to .zshrc file

# source functions
source "$HOME/.oh-my-zsh/custom/funs/kmNameRND.zsh"

# rather than adding stuff to the .zshrc file in the home dir which isnt being syncd with git
# this file is read by oh-my-zsh.sh
# can add what you would've put into ~/.zshrc like path variables

# export PATH="$PATH:/home/adombrowski/.local/bin"
export PATH="$PATH:/usr/lib/wsl/lib"

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

export PATH="$PATH:~/dart-sass"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adombrowski/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/adombrowski/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/home/adombrowski/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="$PATH:/home/adombrowski/anaconda3/bin"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Also gets set in ~/.condarc
# conda config --set auto_activate_base True
conda config --set auto_activate_base False
export PATH="$PATH:/usr/local/cuda-12.5/bin"

# export PATH="$PATH:$(yarn global bin)"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# pnpm
export PNPM_HOME="/home/adombrowski/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PATH:$PNPM_HOME" ;;
esac
# pnpm end

# Java
export JAVA_HOME="/usr/java/jdk-22-oracle-x64"

export DEFAULT_USERNAME="adombrowski"
export DEFAULT_USER="adombrowski"

# watchman bin
export PATH="$PATH:~/watchman-v2024.04.08.00-linux/bin"

# export PATH="~/jdk-22.0.1/bin:$PATH"

export ANDROID_HOME="/mnt/a/akdfl/android_studio/android-sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="$PATH:~/.console-ninja/.bin"

# Add Go to Path
export PATH="$PATH:/usr/local/go/bin"

# put TABSIZE=0 in your environment, to tell `ls` to align using spaces, not tabs.
export TABSIZE=0

# asus windows laptop paths from WSL
export DRIVE_A='/mnt/a'
export DRIVE_C='/mnt/c'
export AKDFL="${DRIVE_A}/akdfl"
export PICS="${AKDFL}/A_Pictures"
export ANTHONY_PICS="${PICS}/anthony"
export KAPTCHA_ME_PICS="${PICS}/kaptcha-me"
export STOCK_PICS="${PICS}/stock-imgs"
export ICONS_PICS="${STOCK_PICS}/icons"
export CAR_PICS="${PICS}/car"
export VIDS="${AKDFL}/A_Videos"
export DOCS="${AKDFL}/A_Documents"
export A_MUSIC="${AKDFL}/A_Music"
export DOWNLOADS="${AKDFL}/A_Downloads"
export A_AUDIO="${AKDFL}/audio"
export ADOMBROWSKI="${DRIVE_C}/Users/adombrowski"
export WSL_PATHS=("DRIVE_A" "DRIVE_C" "AKDFL" "PICS" "ANTHONY_PICS" "KAPTCHA_ME_PICS" "STOCK_PICS" "ICONS_PICS" "CAR_PICS" "VIDS" "DOCS" "A_MUSIC" "DOWNLOADS" "A_AUDIO" "ADOMBROWSKI")
