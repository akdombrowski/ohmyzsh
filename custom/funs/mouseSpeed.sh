#!/usr/bin/env bash

# helpful bash tips
#
# "$*": concatenate arguments into a single string
# "$@": array of arguments
# "$#": number of arguments
# "$0": location of fn call
# "$1": first arg given
#

# from xset man page
#  By default the pointer (the on-screen  representation  of  the
#  pointing device) will go `acceleration' times as fast when the
#  device  travels  more  than `threshold' mickeys (i.e. would-be
#  pixels) in 10 ms, including a  small  transition  range.  This
#  way,  the  pointing  device  can be used for precise alignment
#  when it is moved slowly, yet it can be set  to  travel  across
#  the  screen in a flick of the wrist when desired.  One or both
#  parameters for the m option can be omitted, but if only one is
#  given, it will be interpreted as the acceleration.  If no  pa‐
#  rameters  or  the  flag 'default' is used, the system defaults
#  will be set.

#  If the `threshold' parameter is provided and 0, the `accelera‐
#  tion' parameter will be used in the exponent of a more natural
#  and continuous formula, giving precise control for slow motion
#  but big reach for fast motion, and  a  progressive  transition
#  for  motions  in between.  Recommended `acceleration' value in
#  this case is 3/2 to 3, but not limited to that range.

#  In the X.org X Server 1.6 and above, the  behaviour  described
#  so  far is linked to the default profile. There are other pro‐
#  files (i.e. functions determining  pointer  acceleration  from
#  device  velocity)  and  additional  settings, so the above de‐
#  scription may not apply to non-default  cases.  In  the  X.org
#  Server  1.7,  these  are  available as input device properties
#  (see xinput).

get_ergo_speed() {
  # echo "$(xinput list-props 'ERGO M575 Mouse' | grep -ioP '(?<=Accel Speed \(\d\d\d\)\:\s).?\d+.?\d*')"
  xinput list-props 'ERGO M575 Mouse' | grep -ioP '(?<=Accel Speed \(\d\d\d\)\:\s).?\d+.?\d*'
}

get_ergo_feedbacks() {
  local feedback
  feedback="$(xinput get-feedbacks 'ERGO M575 Mouse')"
  # echo "$(echo \"$feedback\" | grep -i 'is')"
  echo "$feedback" | grep -i 'is'
}

get_ergo() {
  shopt -s extglob
  # shopt | grep extglob
  # zsh uses `setopt`
  # BUT, zsh also has different parameter expansion rules
  # setopt extendedglob
  # setopt

  SPEED="$(get_ergo_speed)"
  FDBK="$(get_ergo_feedbacks)"

  accel=$(echo "$FDBK" | grep accelNum)
  accel="${accel##+([![:digit:]])}"
  denom=$(echo "$FDBK" | grep Denom)
  denom="${denom##+([![:digit:]])}"
  thresh=$(echo "$FDBK" | grep thresh)
  thresh="${thresh##+([![:digit:]])}"

  # printf "speed: %s \naccelNum: %s \naccelDenom: %s \nthreshold: %s \n" "$SPEED" "$accel" "$denom"
  # "$thresh"
  declare -a arr
  arr=("$SPEED" "$thresh" "$accel" "$denom")
  # printf "%s\n%s\n%s\n%s\n" "$SPEED" "$accel" "$denom" "$thresh"

  # intentionally left arg unquoted to avoid returning as a single string
  # shellcheck disable=SC2068
  echo "${arr[@]}"
}

print_ergo_nice() {
  SPEED="$1"
  accel="$2"
  denom="$3"
  thresh="$4"
  printf "speed: %s \naccelNum: %s \naccelDenom: %s \nthreshold: %s \n" "$SPEED" "$accel" "$denom" "$thresh"
}

create_notification() {
  shopt -s extglob
  #  setopt extendedglob

  # if no argument was given, set speed to default defined above
  if [ $# = 0 ]; then
    printf "no args given\n"
    return 1
  fi

  INPUT="$*"
  INPUT_COUNT="$#"
  INPUT_ARR="$1"

  # "$*": concatenate arguments into a single string
  # "$@": array of arguments
  # "$#": number of arguments
  # "$0": location of fn call
  # "$1": first arg given
  # printf "\$*: %s \n" "$*"
  # printf "\$@: %s \n" "$@"
  # printf "\$#: %s \n" "$#"
  # printf "\$0: %s \n" "$0"
  # printf "\$1: %s \n" "$1"
  # printf "\$2: %s \n" "$2"
  # printf "\$3: %s \n" "$3"

  if [[ "$(declare -p INPUT)" =~ "declare -a" ]]; then
    # echo array
    SPEED="${INPUT_ARR[0]}"
    THRESH="${INPUT_ARR[1]}"
    ACCEL="${INPUT_ARR[2]}"
    DENOM="${INPUT_ARR[3]}"
  elif [ "$INPUT_COUNT" == 4 ]; then
    SPEED="$1"
    THRESH="$2"
    ACCEL="$3"
    DENOM="$4"
  else
    echo "missing values"
    return 1
  fi

  printf "speed: %s \naccel: %s \ndenom: %s \nthresh: %s\n" "$SPEED" "$ACCEL" "$DENOM" "$THRESH"
  # ${parameter//pattern/string}
  # levels: low, normal, critical (will ignore time limit)
  URGENCY="normal"
  DUR_MILLIS=2500
  ICON="$HOME/Pictures/icons/Speedy_Gonzales.png"
  notify-send -u "$URGENCY" -t "$DUR_MILLIS" -i "$ICON" "getPhast" "speed: $SPEED \nthreshold: $THRESH \naccel: $ACCEL \naccelDenom: $DENOM"
}

set_ergo_feedback() {
  # set-ptr-feedback device threshold num denom
  #  Change the pointer acceleration (or feed‐
  #  back)  parameters of device.  The xset(1)
  #  man page  has  more  details.  For  X.Org
  #  Server  1.7  and  above,  there are addi‐
  #  tional device  properties  pertaining  to
  #  pointer  acceleration.  These  do not re‐
  #  place, but complement the  pointer  feed‐
  #  back setting.

  printf "\tmouseSpeed.sh--set_ergo_feedback: starting\n" >>"$HOME"/phast.err
  exec 2>>"$HOME"/phast.err

  local accel
  local denom
  local threshold
  # $opt will hold the current option
  while getopts h opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    h)
      # printf "dry run only...\n\n"
      printf "set_ergo_feedback [threshold acceleration denominator] \n"
      printf "\nadjusts mouse feedback (acceleration) \n\n"
      printf "  pass ALL of the following values (in order shown) \n"
      printf "  or none of them for defaults: \n"
      printf "\n\t\t  threshold acceleration denominator \n\n"
      printf "*note that the following values are the defaults used if no values are given \n"
      printf "\t  e.g., \n"
      printf "\t\t  > set_ergo_feedback 0 3 1 \n"
      printf "\t\t  sets... \n"
      printf "\t\t  \t\t  threshold=0 \n"
      printf "\t\t  \t\t  acceleration=3 \n"
      printf "\t\t  \t\t  denominator=1 \n\n"
      return 0
      ;;
      # matches a question mark
      # (and nothing else, see text)
    \?)
      printf "Bad option, aborting \n".
      return 1
      ;;
    *)
      printf "Bad option, aborting \n".
      return 1
      ;;
    esac
  done

  if [ "${OPTIND}" -gt 1 ]; then
    shift "$((OPTIND - 1))"
  fi
  # if no argument was given, set speed to defaults defined after ':-'
  # i.e., 0 3 1
  threshold="${1:-0}"
  accel="${2:-3}"
  denom="${3:-1}"

  if [ -n "$threshold" ]; then
    threshold=0
  fi
  if [ -n "$accel" ]; then
    accel=3
  fi
  if [ -n "$denom" ]; then
    denom=1
  fi

  # printf "setting ptr feedback to threshold=%s accel=%s denom=%s \n" "$threshold" "$accel" "$denom"

  # arguments are: <threshold> <num> <denom>
  # default is 2 1 4
  # xinput set-ptr-feedback "ERGO M575 Mouse" 0 3 1
  xinput set-ptr-feedback "ERGO M575 Mouse" "$threshold" "$accel" "$denom"
  # printf "updated feedback: \n%s" "$(xinput get-feedbacks 'ERGO M575 Mouse')"

  printf "\tmouseSpeed.sh--set_ergo_feedback: done\n" >>"$HOME"/phast.err

}

set_ergo_mouse_speed() {
  printf "\tmouseSpeed.sh--set_ergo_mouse_speed: starting\n" >>"$HOME"/phast.err
  exec 2>>"$HOME"/phast.err

  local opt
  local DEFAULT_SPEED
  local SPEED_ADJ
  local SPEED
  # local CURR_SPEED
  # CURR_SPEED="$(xinput list-props 'ERGO M575 Mouse' | grep -ioP '(?<=Accel Speed \(\d\d\d\)\:\s).?\d+.?\d*')"
  SPEED_ADJ=0.1
  DEFAULT_SPEED=0.0
  SPEED="$DEFAULT_SPEED"
  SPEED="${1:-$DEFAULT_SPEED}"

  # if no argument was given, set speed to default defined above
  if [ $# = 0 ]; then
    printf "no args given, so using mouse speed default: %s \n" "$DEFAULT_SPEED"
    printf "\tmouseSpeed.sh: no args given, so using mouse speed default: %s \n" "$DEFAULT_SPEED" >>"$HOME"/phast.err
  fi

  # $opt will hold the current option
  while getopts s:fidh opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    s)
      # set mouse speed to specified value\
      SPEED="${OPTARG:-${DEFAULT_SPEED}}"
      printf "setting mouse to max speed = %s \n" "$MAX_MOUSE_SPEED"
      printf "\tmouseSpeed.sh: setting mouse speed to %s \n" "$SPEED" >>"$HOME"/phast.err
      # printf "setting mouse speed to %s \n" "$SPEED"
      ;;
    f)
      # SET MOUSE SPEED TO $MAX_MOUSE_SPEED
      SPEED="$MAX_MOUSE_SPEED"
      ;;
    i)
      # increment mouse speed by ...
      printf "increasing mouse speed by %s \n" "$SPEED_ADJ"
      printf "option incomplete, come back later. \n"
      return 1
      ;;
    d)
      # decrement mouse speed by ...
      printf "decreasing mouse speed by %s \n" "$SPEED_ADJ"
      printf "option incomplete, come back later. \n"
      return 1
      ;;
    h)
      # printf "dry run only...\n\n"
      printf "\tadjusts mouse speed \n"
      printf "\tavailable flags: \n"
      printf "\t\t-s  \t  follow with the desired mouse accel speed (float) \n"
      printf "\t\t-f  \t  set mouse accel speed to max speed (found in env var: MAX_MOUSE_SPEED) \n"
      return 0
      ;;
      # matches a question mark
      # (and nothing else, see text)
    \?)
      printf "Bad option, aborting \n".
      printf "\tmouseSpeed.sh: Bad option, aborting \n" >>"$HOME"/phast.err
      return 1
      ;;
    *)
      printf "Bad option, aborting \n".
      printf "\tmouseSpeed.sh: Bad option, aborting \n" >>"$HOME"/phast.err
      return 1
      ;;
    esac
  done

  if [ "${OPTIND}" -gt 1 ]; then
    shift "$((OPTIND - 1))"
  fi
  # ((OPTIND >1)) && shift "$((OPTIND - 1))"

  # Example of Props for Accel:
  # libinput Accel Speed (349):	-0.858065
  # libinput Accel Speed Default (350):	0.000000
  # libinput Accel Profiles Available (351):	1, 1, 1
  # libinput Accel Profile Enabled (352):	1, 0
  # libinput Accel Profile Enabled Default (353):	1, 0, 0
  # libinput Accel Custom Fallback Points (354):	<no items>
  # libinput Accel Custom Fallback Step (355):	0.000000
  # libinput Accel Custom Motion Points (356):	<no items>
  # libinput Accel Custom Motion Step (357):	0.000000
  # libinput Accel Custom Scroll Points (358):	<no items>
  # libinput Accel Custom Scroll Step (359):	0.000000

  local MOUSE_NAME
  # the name is different when connected via proprietary usb device
  #  'Logitech ERGO M575'
  # with bluetooth,it's:
  # "ERGO M575 Mouse"
  # MOUSE_NAME="$(xinput list --name-only | grep -i 'ergo m575')"
  MOUSE_NAME="$(xinput list --name-only | grep -i 'ergo m575 mouse')"
  MOUSE_NAME_NUM_RESULTS="$(xinput list --name-only | grep -ic 'ergo m575')"

  # echo "\$MOUSE_NAME_NUM_RESULTS = $MOUSE_NAME_NUM_RESULTS"

  #  this is if using the broader search term
  # if [ "$MOUSE_NAME_NUM_RESULTS" -gt 1 ]; then
  #   printf "found multiple results for 'ergo m575'. selecting first result which may not be connected anymore. \n"
  #   printf "\tmouseSpeed.sh: found %d results for 'ergo m575'. selecting first result which may not be connected anymore. \n%s \n" "$MOUSE_NAME_NUM_RESULTS" "$MOUSE_NAME" >>"$HOME"/phast.err
  # fi
  # MOUSE_NAME="$(xinput list --name-only | grep -im 1 'ergo m575')"
  # local MOUSE_ID
  # MOUSE_ID="$(xinput list --id-only $MOUSE_NAME)"

  # printf "MOUSE_NAME: %s \n\n" "$MOUSE_NAME"
  # printf "MOUSE_ID: %s \n\n" "$MOUSE_ID"

  if [ -z "$MOUSE_NAME" ]; then
    printf "MOUSE_NAME var empty. Couldn't find the right mouse. \n"
  else
    # printf "MOUSE_NAME = %s \n" "$MOUSE_NAME"
    # printf "SPEED = %s \n" "$SPEED"

    xinput set-prop "$MOUSE_NAME" "libinput Accel Speed" "$SPEED"
  fi

  printf "\tmouseSpeed.sh--set_ergo_mouse_speed: done\n" >>"$HOME"/phast.err

  # optionally print out new speed to ensure it updated
  # get_ergo_speed
}
