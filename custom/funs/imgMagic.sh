#!/bin/bash

b_to_w() {

  pwd

  # "*(N)"
  #   is a list of all files in current dir
  for file in *(N); do
    if [ ! -d "$file" ]; then
      printf "making white alternate version of %s \n" "$file"
      magick "$file" -white-threshold -1 "white-${file}"
    fi
  done
}
