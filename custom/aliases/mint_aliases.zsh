#!/bin/zsh

alias os="echo $(uname -sro)"

alias whichAlias="echo mint_aliases"

alias whichFileManager="echo $(xdg-mime query default inode/directory)"
alias setDefaultFileMgr="echo $(xdg-mime default org.kde.dolphin.desktop inode/directory)"

alias subl="/opt/sublime_text/sublime_text --launch-or-new-window "
# sublime_text [arguments] -               Edit stdin
alias sublStdIn="/opt/sublime_text/sublime_text -n - "
# sublime_text [arguments] - >out          Edit stdin and write the edit to stdout
alias sublStdIn2Out="/opt/sublime_text/sublime_text -n - >out "

alias inputDevicesList="xinput --list --short"
alias ergo="xinput --list-props \"ERGO M575 Mouse\""
alias ergoFeed="xinput set-ptr-feedback \"ERGO M575 Mouse\" 0 3 1"
alias ergoSpeed="xinput set-prop \"ERGO M575 Mouse\" \"libinput Accel Speed\" 1"
# needs 3 inputs 'threshold speed denominator' see 'ergoFeed' above
alias setErgoFeed="xinput set-ptr-feedback \"ERGO M575 Mouse\" "
# needs 1 input for accel speed ' see 'ergoSpeed' above
alias setErgoSpeed="xinput set-prop \"ERGO M575 Mouse\" \"libinput Accel Speed\" "
# script which sets both ergo accel speed and feedback
alias setErgoFast=". $SET_FAST_MOUSE_SCRIPT 1"
alias phast=". $SET_FAST_MOUSE_SCRIPT 1"

alias APP_LOCATIONS="printf \"%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n\" $FLATPAK_APPS $LOCAL_SNAP_APPS $ROOT_SNAP_APPS $LOCAL_DESKTOP_FILES $LOCAL_APP_FILES $LOCAL_APP_CONFIG $OTHER_APPS $USR_BIN $USR_LIB $USR_SHARE"
