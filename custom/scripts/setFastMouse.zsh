#!/bin/zsh

# shellcheck source=../funs/mouseSpeed.zsh
# . "$ZSH_CUSTOM/funs/mouseSpeed.zsh"
. "$ZSH_CUSTOM/funs/mouseSpeed.sh"

# printf "\nCURRENT ergo speed: %s \n" "$(get_ergo_speed)"

# printf "\$1 = %s\n" "$1"

# printf "\nsetting accel speed...\n\n"

set_ergo_mouse_speed -s "$1"

# printf "\ndone\n\nsetting feedback...\n\n"

set_ergo_feedback

# printf "\n\ndone\n"

# printf "NEW ergo settings: \n\n"
printf "\t\tSPEED: \n%s \n\n---\n\n" "$(get_ergo_speed)"
printf "\t\tFEEDBACK: \n%s \n" "$(get_ergo_feedbacks)"
