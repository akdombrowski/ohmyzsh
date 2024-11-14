#!/bin/zsh

export SET_FAST_MOUSE_SCRIPT="$ZSH_CUSTOM/scripts/setFastMouse.zsh"

alias os="echo $(uname -sro)"

alias whichAlias="echo mint_aliases"

alias whichFileManager="echo $(xdg-mime query default inode/directory)"
alias setDefaultFileMgr="echo $(xdg-mime default org.kde.dolphin.desktop inode/directory)"


alias subl="/opt/sublime_text/sublime_text --launch-or-new-window "

alias inputDevicesList="xinput --list --short"
alias ergo="xinput --list-props \"ERGO M575 Mouse\""
alias setErgoFeed="xinput set-ptr-feedback \"ERGO M575 Mouse\" 0 3 1"
alias setErgoSpeed="xinput set-prop \"ERGO M575 Mouse\" \"libinput Accel Speed\" 1"

alias setErgoFast=". $SET_FAST_MOUSE_SCRIPT 1"
