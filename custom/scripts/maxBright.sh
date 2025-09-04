#!/usr/bin/env bash

local ERRORS_PATH="${HOME}/logs/maxBright_error.log"
touch "$ERRORS_PATH"
echo "maxBright.sh--$(date +%m/%d/%y_%H:%M:%S) - starting" >>"$ERRORS_PATH"
exec 2>>"$ERRORS_PATH"



# use funs
. "$ZSH_FUNS/brightness.zsh"

# use one to get nvidia settings files
# - nvbs
# - ls $NVB_SETTINGS

# uses settings file $NVB_SETTINGS/.nvidia-settings-rc_{name}
nvbl super-bright

# 
# 
# 
# 
# 

# echo "phast.sh--$(date +%m/%d/%y_%H:%M:%S) - starting" >>"$HOME"/phast.err
# exec 2>>"$HOME"/phast.err

# # shellcheck source=/home/akdombrowski/.oh-my-zsh/custom/funs/mouseSpeed.sh
# . "$FUNZ/mouseSpeed.sh"
# # . "$FUNZ/mouseSpeed.sh"

# # printf "\nCURRENT ergo speed: %s \n" "$(get_ergo_speed)"

# # printf "\$1 = %s\n" "$1"

# # printf "\nsetting accel speed...\n\n"

# printf "\$1=%s \$2=%s  \$3=%s  \$4=%s \n\n" "$1" "$2" "$3" "$4"
# set_ergo_mouse_speed -s "$1"

# # printf "\ndone\n\nsetting feedback...\n\n"
# if [ "$#" -gt 1 ]; then
#   shift 1
# fi

# printf "\$1=%s \$2=%s  \$3=%s  \$4=%s \n\n" "$1" "$2" "$3" "$4"

# # FDBK_INPUTS="$2 $3 $4"
# # FDBK_INPUTS=("$@")
# # FDBK_STAR_INPUTS=("$*")
# # # set_ergo_feedback "$2 $3 $4"
# # # set_ergo_feedback "$2" "$3" "$4"
# # echo "\${FDBK_INPUTS[@]}"
# # echo "${FDBK_INPUTS[@]}"
# # echo "\${FDBK_STAR_INPUTS[@]}"
# # echo "${FDBK_STAR_INPUTS[@]}"
# # echo -n "\$FDBK_INPUTS="
# # echo "$FDBK_INPUTS"
# set_ergo_feedback "${FDBK_INPUTS[@]}"
# # set_ergo_feedback "${FDBK_STAR_INPUTS[@]}"
# # echo -n "\$@="
# # echo "$@"
# # set_ergo_feedback "$@"

# # printf "\n\ndone\n"

# # # printf "NEW ergo settings: \n\n"
# # printf "SPEED: %s \n" "$(get_ergo_speed)"
# # printf "FEEDBACK: \n%s \n" "$(get_ergo_feedbacks)"
# declare -a ERGO
# # ERGO=($(get_ergo))
# # For bash 4.4+, must not be in posix mode, may use temporary files
# mapfile -t ERGO < <(get_ergo)

# # debugging
# # printf "\${#ERGO[@]} # args: %d \n\n" ${#ERGO[@]}
# # printf "\"\${#ERGO[@]}\" # args: %d \n\n" "${#ERGO[@]}"
# # printf "\"\${ERGO[@]}\": %s \n\n" "${ERGO[@]}"
# # printf "\${ERGO[@]}: %s \n\n" ${ERGO[@]}
# # printf "\"\$ERGO\": %s \n\n" "$ERGO"

# # intentionally left arg unquoted to avoid concatenating into a single string
# # shellcheck disable=SC2068
# create_notification ${ERGO[@]}


# echo "phast.sh - done " >>"$HOME"/phast.err
