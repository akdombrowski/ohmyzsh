#!/usr/bin/env bash

mouse_fast() {
  # shellcheck source=../funs/mouseSpeed.sh
  . "$FUNZ/mouseSpeed.zsh"

  # printf "\nCURRENT ergo speed: %s \n" "$(get_ergo_speed)"

  # printf "\$1 = %s\n" "$1"

  # printf "\nsetting accel speed...\n\n"

  set_ergo_mouse_speed -s "$1"

  # printf "\ndone\n\nsetting feedback...\n\n"

  set_ergo_feedback "$2" "$3" "$4"

  # printf "\n\ndone\n"

  # printf "NEW ergo settings: \n\n"
  printf "SPEED: %s \n" "$(get_ergo_speed)"
  printf "FEEDBACK: \n%s \n" "$(get_ergo_feedbacks)"
}
