#!/usr/bin/env zsh

export PATH="$PATH:/snap/bin:/snap:/opt"

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="qt5ct"

export MAX_MOUSE_SPEED=2
export MIN_MOUSE_SPEED=0.1
export CURR_MOUSE_SPEED="\$()"
export MOUSE_NAME_LOGI="Logitech ERGO M575"
export MOUSE_NAME_BT="ERGO M575 Mouse"
export SET_FAST_MOUSE_SCRIPT="$ZSH_CUSTOM/scripts/setFastMouse.sh"

# locations for various app files in linux mint
export FLATPAK_APPS='/var/lib/flatpak/app'
export LOCAL_SNAP_APPS="$HOME/snap"
export ROOT_SNAP_APPS='/snap'
export LOCAL_DESKTOP_FILES="$HOME/.local/share/applications"
export LOCAL_APP_FILES="$HOME/.var/app"
export LOCAL_APP_CONFIG="$HOME/.config"
export OTHER_APPS='/opt'
export USR_BIN='/usr/bin'
export USR_LIB='/usr/lib'
export USR_SHARE='/usr/share'

# location of backup and test config-related stuff for linux mint
export HOME_CINNAMON_DIR="$HOME/Cinnamon"
# nvidia-settings config files
export NVB_FILES="$HOME_CINNAMON_DIR/nvidia-settings"
