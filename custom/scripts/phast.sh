#!/bin/bash

touch "$HOME"/phast.err
echo "phast.sh--$(date \"+%m/%d/%y %H:%M:%S\") - " >> "$HOME"/phast.err
exec 2>>"$HOME"/phast.err

# shellcheck source=/home/akdombrowski/.oh-my-zsh/custom/funs/mouseSpeed.sh
. "$ZSH_CUSTOM/funs/mouseSpeed.sh"
# . "$ZSH_CUSTOM/funs/mouseSpeed.sh"

# printf "\nCURRENT ergo speed: %s \n" "$(get_ergo_speed)"

# printf "\$1 = %s\n" "$1"

# printf "\nsetting accel speed...\n\n"

set_ergo_mouse_speed -s "$1"

# printf "\ndone\n\nsetting feedback...\n\n"

set_ergo_feedback -s "$2" "$3" "$4"

# printf "\n\ndone\n"

# # printf "NEW ergo settings: \n\n"
# printf "SPEED: %s \n" "$(get_ergo_speed)"
# printf "FEEDBACK: \n%s \n" "$(get_ergo_feedbacks)"

ERGO=($(get_ergo))

create_notification
