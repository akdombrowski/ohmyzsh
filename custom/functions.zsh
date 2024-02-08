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

# testopts() {
#   # $opt will hold the current option
#   local opt
#   while getopts ab: opt; do
#     # loop continues till options finished
#     # see which pattern $opt matches...
#     case $opt in
#     a)
#       print Option a set
#       ;;
#     b)
#       print Option b set to $OPTARG
#       ;;
#       # matches a question mark
#       # (and nothing else, see text)
#     \?)
#       print Bad option, aborting.
#       return 1
#       ;;
#     esac
#   done
#   ((OPTIND > 1)) && shift $((OPTIND - 1))
#   print Remaining arguments are: $*
# }

