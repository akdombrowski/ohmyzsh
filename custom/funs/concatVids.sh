#!/usr/bin/env bash

function concatVids() {

  # $opt will hold the current option
  local opt
  # removed the ":" so that the value following the "-c" flag wouldn't be read
  # with that flag
  while getopts cxf: opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
    c)
      local c=1
      printf("c=", c, "\n")
      ;;
    x)
      local x=".$OPTARG"
      ;;
    f)
      local f=".$OPTARG"
      printf("f=", f, "\n")
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

  # First need a list of files to concatenate
  # echo "file '2025-05-23_11-41-33.mp4' \nfile: '2025-05-23_11-42-33.mp4'" > vids.txt

  # # use ffmpeg to concatenate videos listed in file from previous step
  # ffmpeg -f concat -i vids.txt -c copy output1.mp4
}