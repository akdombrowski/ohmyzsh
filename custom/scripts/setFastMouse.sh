#!/bin/bash

echo "zsh custom dir = ${ZSH_CUSTOM}"

# shellcheck source=../funs/mouseSpeed.zsh
source "$ZSH_CUSTOM/funs/mouseSpeed.zsh"

printf "\nCURRENT ergo speed: %s \n\n" "$(get_ergo_speed)"

# printf "\$1 = %s\n" "$1"

set_ergo_mouse_speed -s "$1"

printf "\nNEW ergo speed: %s \n\n" "$(get_ergo_speed)"

exit
