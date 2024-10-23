# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin${PATH:+":$PATH"}
export PATH=$HOME/bin:$HOME/.local/bin:/bin:/usr/local/bin:/usr/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
zstyle ':omz:update' frequency 7

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

source $ZSH/oh-my-zsh.sh

# # User configuration

# # export MANPATH="/usr/local/man:$MANPATH"

# # You may need to manually set your language environment
# # export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
# # if [[ -n $SSH_CONNECTION ]]; then
# #   export EDITOR='vim'
# # else
# #   export EDITOR='mvim'
# # fi
# # if [[ -n $SSH_CONNECTION ]]; then
# #   export EDITOR='nano'
# # else
# #   export EDITOR='nano'
# # fi
# export EDITOR='nano'

# # Compilation flags
# # export ARCHFLAGS="-arch x86_64"

# # Set personal aliases, overriding those provided by oh-my-zsh libs,
# # plugins, and themes. Aliases can be placed here, though oh-my-zsh
# # users are encouraged to define aliases within the ZSH_CUSTOM folder.
# # For a full list of active aliases, run `alias`.
# #
# # Example aliases
# # alias zshconfig="mate ~/.zshrc"
# # alias ohmyzsh="mate ~/.oh-my-zsh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# export PATH="$PATH:~/dart-sass"

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/adombrowski/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
# if [ $? -eq 0 ]; then
#   eval "$__conda_setup"
# else
#   if [ -f "/home/adombrowski/anaconda3/etc/profile.d/conda.sh" ]; then
#     . "/home/adombrowski/anaconda3/etc/profile.d/conda.sh"
#   else
#     export PATH="$PATH:/home/adombrowski/anaconda3/bin"
#   fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# # Also gets set in ~/.condarc
# # conda config --set auto_activate_base True
# conda config --set auto_activate_base False

# export PATH="$PATH:/usr/lib/wsl/lib"

# # export PATH="$PATH:$(yarn global bin)"

# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# export PATH="$PATH:/home/adombrowski/.local/bin"

# export PATH="$PATH:~/.console-ninja/.bin"

# # Add Go to Path
# export PATH="$PATH:/usr/local/go/bin"

# # pnpm
# export PNPM_HOME="/home/adombrowski/.local/share/pnpm"
# case ":$PATH:" in
# *":$PNPM_HOME:"*) ;;
# *) export PATH="$PATH:$PNPM_HOME" ;;
# esac
# # pnpm end

# export DEFAULT_USERNAME="adombrowski"
# export DEFAULT_USER="adombrowski"

# # watchman bin
# export PATH=$PATH:~/watchman-v2024.04.08.00-linux/bin

# export PATH="$PATH:~/jdk-22.0.1/bin"

# export ANDROID_HOME="/mnt/a/akdfl/android_studio/android-sdk"
# export PATH="$PATH:$ANDROID_HOME/emulator"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"

# PATH=$PATH:~/.console-ninja/.bin

# # put TABSIZE=0 in your environment, to tell `ls` to align using spaces, not tabs.
# export TABSIZE=0

# # asus windows laptop paths from WSL
# export DRIVE_A='/mnt/a'
# export DRIVE_C='/mnt/c'
# export AKDFL="${DRIVE_A}/akdfl"
# export PICS="${AKDFL}/A_Pictures"
# export ANTHONY_PICS="${PICS}/anthony"
# export KAPTCHA_ME_PICS="${PICS}/kaptcha-me"
# export STOCK_PICS="${PICS}/stock-imgs"
# export ICONS_PICS="${STOCK_PICS}/icons"
# export CAR_PICS="${PICS}/car"
# export VIDS="${AKDFL}/A_Videos"
# export DOCS="${AKDFL}/A_Documents"
# export A_MUSIC="${AKDFL}/A_Music"
# export DOWNLOADS="${AKDFL}/A_Downloads"
# export A_AUDIO="${AKDFL}/audio"
# export ADOMBROWSKI="${DRIVE_C}/Users/adombrowski"
# export WSL_PATHS=("DRIVE_A" "DRIVE_C" "AKDFL" "PICS" "ANTHONY_PICS" "KAPTCHA_ME_PICS" "STOCK_PICS" "ICONS_PICS" "CAR_PICS" "VIDS" "DOCS" "A_MUSIC" "DOWNLOADS" "A_AUDIO" "ADOMBROWSKI")