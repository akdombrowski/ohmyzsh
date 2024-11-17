#!/bin/bash

get_flatpak_apps() {
  echo ""
  ls -C /var/lib/flatpak/app
  echo ""
  local app_dir
  local apps
  app_dir="/var/lib/flatpak/app"

  # use find -exec instead of for loop
  find "$app_dir" -mindepth 1 -type f -regex ".*/share/applications/.*\.desktop"
  # for file in "$app_dir"/**/share/applications/*.desktop; do
  #   echo "$file"
  # done;
  echo ""
}

get_desktops() {
  local dirs
  local apps
  apps="$(get_flatpak_apps)"

  echo "$apps"

}

get_flatpak_apps
exit
# get_desktops; exit
