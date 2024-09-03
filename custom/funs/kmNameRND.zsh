kmNameRND() {
  # $opt will hold the current option
  local opt
  local xtn
  local prefix

  while getopts xb:dh opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    x)
      xtn=".$OPTARG"
      print "extension=$OPTARG"
      ;;
    p)
      prefix=".$OPTARG"
      print "basename=$OPTARG"
      ;;
    d)
      dryrun=1
      printf "dry run only...\n\n"
      ;;
    h)
      print "makes a copy of each of the files in current dir with a rnd UUID attached to the filename"
      print "available flags:"
      print "  -x  \t  the name of the file extension (e.g., 'kmNameRND -x \"png\"')"
      print "      \t  (e.g., 'kmNameRND -x \"png\"')"
      print "      \t  *it is recommended to specify the extension"
      print "  -p  \t  the desired prefix of the new filename before the UUID"
      print "      \t  (e.g., 'kmNameRND -p \"km-\"')"
      print "      \t  *include the separator if one is desired"
      return 0
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

  local pre="${prefix+kaptcha-me-}"
  local rename
  local extension

  local newFilesDirName="kaptcha-me-rename-$(date +%Y%m%d_%H%M%S)"

  if [ -z ${dryrun+x} ]; then
    if [ ! -d $newFilesDirName ]; then
      echo "creating \"$newFilesDirName\" dir for new files"
      mkdir $newFilesDirName
    fi
  fi

  # "*(N)"
  #   is a list of all files in current dir
  for file in *(N); do
    if [ ! -d $file ]; then

      if [ -z ${xtn+x} ]; then
        if [[ "${file: -${#xtn}}" == "${xtn}" ]]; then
          rename="${pre}$(uuidgen -r)${xtn}"
        fi
      else
        extension=${file##*.}
        rename="${pre}$(uuidgen -r).${extension}"
      fi
      printf "%-24s %s %53s\n" ${file} "->" ${rename}

      if [ -z ${dryrun+x} ]; then
        cp $file "$newFilesDirName/${rename}"
      fi
    fi
  done
}
