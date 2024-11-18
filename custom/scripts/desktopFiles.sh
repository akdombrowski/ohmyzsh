#!/bin/bash

get_flatpak_apps() {
  # echo ""
  # ls -C /var/lib/flatpak/app
  # echo ""
  local app_dir
  local app_dir2
  local app_dir3
  local app_dir4
  local apps

  zsh /home/akdombrowski/.zshrc

  app_dir="$FLATPAK_APPS"
  app_dir2="$LOCAL_SNAP_APPS"
  app_dir3="$ROOT_SNAP_APPS"
  app_dir4="$OTHER_APPS"

  # printf "searching for apps in... \n%s \n%s \n%s \n%s \n" "$app_dir" "$app_dir2" "$app_dir3" "$app_dir4"
  # use find -exec instead of for loop
  # https://man7.org/linux/man-pages/man1/find.1.html
  find "$app_dir" -mindepth 2 -type f -name "*.desktop" -printf "%f \n" -exec grep -iP "Exec=" ";"
  printf "\n"
  find "$app_dir2" -mindepth 2 -type f -name "*.desktop" -printf "%f \n"
  printf "\n"
  sudo find "$app_dir3" -mindepth 2 -type f -name "*.desktop" -printf "%f \n"
  printf "\n"
  sudo find "$app_dir4" -mindepth 2 -type f -name "*.desktop" -printf "%f \n"
  printf "\n"
  # # for file in "$app_dir"/**/share/applications/*.desktop; do
  #   echo "$file"
  # done;
  # echo ""
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
