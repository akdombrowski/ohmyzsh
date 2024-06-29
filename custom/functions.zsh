#!/usr/bin/env BASH

#
# ---HELPFUL BASH COMMANDS---
#
# replace one match in string
# ${parameter/pattern/string}
# replace all matches in string
# ${parameter//pattern/string}
#
#
#

rnd() {
  local rnd="$(openssl rand -base64 128)"
  local rndOneLine="${rnd//[$'\t\r\n ']/}"
  echo "$rndOneLine"
  echo -n "$rndOneLine" | xclip -selection clipboard
}

rndN() {
  local n="$1"
  if [[ -z "$n" || "$n" -le 0 ]]; then
    echo "follow 'rndN' with number of bytes needed" >&2
  else
    local rnd="$(openssl rand -base64 $n)"
    local rndOneLine="${rnd//[$'\t\r\n ']/}"
    local msg='on clipboard:'
    echo -n "$rndOneLine" | xclip -selection clipboard
    echo "$msg"
    echo "$rndOneLine"
  fi
}

copy() {
  local argz="$*"
  if [[ -z "$argz" ]]; then
    echo "put something after 'copy' to copy. copy?" >&2
  elif [[ -n "$argz" ]]; then
    local msg='on clipboard:'
    echo -n "$argz" | xclip -selection clipboard
    echo "$msg"
    echo "$argz"
  fi
}


sortaEllas() {
  local argat="$@"
  local arg1="$1"
  local arg2Infini="${@:2}"
  if [[ -z "$argat" ]]; then
    echo "provide one sort option: none, size, time, version, extension" >&2
    echo "e.g.: 'sortaEllas time'" >&2
  elif [[ -n "$argat" ]]; then
    if [[ -z "$arg2Infini" ]]; then
      # echo "sorted by: $arg1"
      # echo ""
      echo "$(ls -A --sort=$arg1)" >&2
    elif [[ -n "$arg2Infini" ]]; then
      local noDashes="${arg2Infini//-/}"
      local noSpaces="${noDashes// /}"
      # echo "sorted by: $arg1 AND flags: -$noSpaces"
      # echo ""
      #  ${parameter//pattern/string}
      echo "$(ls -A --sort=$arg1 -$noSpaces)" >&2
    fi
  fi
}

rndSuffix() {
  # $opt will hold the current option
  local opt
  # removed the ":" so that the value following the "-c" flag wouldn't be read
  # with that flag
  while getopts cx: opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    c)
      local wantsCopyToClipboard=1
      ;;
    x)
      local extension=".$OPTARG"
      ;;
      # matches a question mark
      # (and nothing else, see text)
    \?)
      print Bad option, aborting.
      return 1
      ;;
    esac
  done
  ((OPTIND > 1)) && shift "$((OPTIND - 1))"
  # print "Remaining arguments are: $*"

  uuid="$(uuidgen -r)"
  rnd="$1-${uuid}${extension}"

  if [[ -n "$wantsCopyToClipboard" ]]; then
    echo -n "$rnd" | xclip -selection clipboard
    echo "$rnd"
  fi
}

rndPrefix() {
  uuid="$(uuidgen -r)"
  arg0="$1"
  rnd="${uuid}-${arg0}"
  echo "$rnd"
}

rndUUID() {
  local uuidr=$(uuidgen -r)
  copy "$uuidr"
}

kaptchame() {
  local uuidr=$(uuidgen -r)
  local kaptchame="kaptcha-me-$uuidr"
  copy "$kaptchame"
}

kaptchaMe_renameFile() {
  # $opt will hold the current option
  local opt
  local xtn
  while getopts x: opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    x)
      xtn=".$OPTARG"
      print "extension = $OPTARG"
      ;;
    b)
      print "Option b's value = $OPTARG"
      ;;
      # matches a question mark
      # (and nothing else, see text)
    \?)
      print Bad option, aborting.
      return 1
      ;;
    esac
  done
  ((OPTIND > 1)) && shift "$((OPTIND - 1))"

  for file in *(N); do
    if [[ "${file: -${#xtn}}" == "${xtn}" ]]; then
      name="katpcha-me-$(uuidgen -r)"
      echo "${file}"
      print "${name}${xtn}"
      cp $file "${name}${xtn}"
    fi
  done
}

magickToolAliases() {
  als=$(alias | grep "magick")
  echo "$als"
}

# prints the env var name and value for the paths to various dir's
wslPaths() {
  for p in "${WSL_PATHS[@]}"; do  # loop through the array
    printenv | grep -w $p
  done
}

# testpromptdir() {
#   echo 'echo ${+PROMPT_PERCENT}'
#   echo ${+PROMPT_PERCENT}
#   echo ""

#   echo 'echo $3~'
#   echo $3~
#   echo ""

#   echo 'echo PROMPT_PERCENT=1'
#   PROMPT_PERCENT=1
#   echo 'echo ${+PROMPT_PERCENT}'
#   echo ${+PROMPT_PERCENT}
#   echo 'echo ${PROMPT_PERCENT}'
#   echo ${PROMPT_PERCENT}
#   echo ""
#   echo ""

#   echo 'echo $3~'
#   echo $3~
#   echo ""

#   echo 'echo %3~'
#   echo %3~
#   echo ""

#   echo 'echo -e "%3~"'
#   echo -e "%3~"
#   echo ""

#   echo 'echo -e "${%%3~}"'
#   echo -e "${%%3~}"
#   echo ""

#   echo 'echo -e "${%3~}"'
#   echo -e "${%3~}"
#   echo ""

#   echo 'echo -e "${%3~}"'
#   echo -e "${%3~}"
#   echo ""

#   echo 'echo -e "${%3~}'
#   echo -e "${%3~}"
#   echo ""

#   set -x
#   echo 'echo if [[ "$~" == "$HOME" ]];'
#   echo ""
#   if [[ "$~" == "$HOME" ]]; then
#     echo "\n\n ***** parent is dir ***** \n\n"
#   else
#     echo " parent \"$~\" is not a dir \n"
#   fi
#   echo ""

#   echo 'echo if [[ $~ == "$HOME" ]];'
#   echo ""
#   if [[ $~ == "$HOME" ]]; then
#     echo "\n\n ***** parent is dir ***** \n\n"
#   else
#     echo " parent '$~' is not a dir \n"
#   fi
#   echo ""

#   echo 'echo if [[ -d $~ ]];'
#   echo ""
#   if [[ -d $~ ]]; then
#     echo "\n\n ***** parent is dir ***** \n\n"
#   else
#     echo " parent '$~' is not a dir \n"
#   fi
#   echo ""

#   echo 'echo if [[ -d $3~ ]];'
#   echo ""
#   if [[ -d $3~ ]]; then
#     echo "\n\n ***** parent is dir ***** \n\n"
#   else
#     echo " parent '$3~' is not a dir \n"
#   fi
#   echo ""

#   echo 'echo if [[ -d "$3~" ]];'
#   echo ""
#   if [[ -d "$3~" ]]; then
#     echo "\n\n ***** parent is dir ***** \n\n"
#   else
#     echo " parent \"$3~\" is not a dir \n"
#   fi
#   echo ""

#   echo 'echo if [[ -d '"'"'$3~'"'"' ]];'
#   echo ""
#   if [[ -d '$3~' ]]; then
#     echo "\n\n ***** parent is dir ***** \n\n"
#   else
#     echo " parent \'$3~\' is not a dir \n"
#   fi
#   echo ""

#   set +x
# }

testopts() {
  # $opt will hold the current option
  local opt
  while getopts ab: opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    a)
      print Option a set
      ;;
    b)
      print Option b set to $OPTARG
      ;;
      # matches a question mark
      # (and nothing else, see text)
    \?)
      print Bad option, aborting.
      return 1
      ;;
    esac
  done
  ((OPTIND > 1)) && shift "$((OPTIND - 1))"
  print Remaining arguments are: $*
}
