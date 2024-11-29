#!/bin/sh

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

  SPEED="$(get_ergo_speed)"
  FDBK="$(get_ergo_feedbacks)"

  accel=$(echo "$FDBK" | grep accelNum)
  accel="${accel##+([![:digit:]])}"
  denom=$(echo "$FDBK" | grep Denom)
  denom="${denom##+([![:digit:]])}"
  thresh=$(echo "$FDBK" | grep thresh)
  thresh="${thresh##+([![:digit:]])}"

  printf "speed: %s \naccelNum: %s \naccelDenom: %s \nthreshold: %s \n" "$SPEED" "$accel" "$denom" "$thresh"

  # ${parameter//pattern/string}
  notify-send -u normal -t 2500 "getPhast" "speed: $SPEED \naccelNum: $accel \naccelDenom: $denom \nthreshold: $thresh"
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

  local accel
  local denom
  local threshold

  # if no argument was given, set speed to defaults defined after ':-'
  accel="${1:-3}"
  denom="${2:-1}"
  threshold="${3:-0}"

  if [ -n "$accel" ]; then
    accel=3
  fi
  if [ -n "$denom" ]; then
    denom=1
  fi
  if [ -n "$threshold" ]; then
    threshold=0
  fi

  # printf "setting ptr feedback to threshold=%s accel=%s denom=%s \n" "$threshold" "$accel" "$denom"

  # arguments are: <threshold> <num> <denom>
  # default is 2 1 4
  # xinput set-ptr-feedback "ERGO M575 Mouse" 0 3 1
  xinput set-ptr-feedback "ERGO M575 Mouse" "$threshold" "$accel" "$denom"
  # printf "updated feedback: \n%s" "$(xinput get-feedbacks 'ERGO M575 Mouse')"
}

set_ergo_mouse_speed() {

  local opt
  local DEFAULT_SPEED
  local SPEED_ADJ
  local SPEED
  # local CURR_SPEED
  # CURR_SPEED="$(xinput list-props 'ERGO M575 Mouse' | grep -ioP '(?<=Accel Speed \(\d\d\d\)\:\s).?\d+.?\d*')"
  SPEED_ADJ=0.1
  DEFAULT_SPEED=0.50
  SPEED="$DEFAULT_SPEED"

  # if no argument was given, set speed to default defined above
  if [ $# = 0 ]; then
    printf "no args given, so using mouse speed default: %s \n" "$DEFAULT_SPEED"
  fi

  # $opt will hold the current option
  while getopts s:fidh opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    s)
      # set mouse speed to specified value\
      SPEED="${OPTARG:-${DEFAULT_SPEED}}"
      # printf "setting mouse speed to %s \n" "$SPEED"
      ;;
    f)
      # SET MOUSE SPEED TO $MAX_MOUSE_SPEED
      SPEED="$MAX_MOUSE_SPEED"
      printf "setting mouse to max speed = %s \n" "$MAX_MOUSE_SPEED"
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
  MOUSE_NAME="$(xinput list --name-only | grep -i 'ergo m575')"
  # local MOUSE_ID
  # MOUSE_ID="$(xinput list --id-only $MOUSE_NAME)"

  # printf "MOUSE_NAME: %s \n\n" "$MOUSE_NAME"
  # printf "MOUSE_ID: %s \n\n" "$MOUSE_ID"

  if [ -z "$MOUSE_NAME" ]; then
    printf "MOUSE_NAME var empty. Couldn't find the right mouse. \n"
  else
    # printf "%s \n" "$MOUSE_NAME"

    xinput set-prop "$MOUSE_NAME" "libinput Accel Speed" "$SPEED"
  fi

  get_ergo_speed
}
