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

  # zsh /home/akdombrowski/.zshrc

  app_dir="$FLATPAK_APPS"
  app_dir2="$LOCAL_SNAP_APPS"
  app_dir3="$ROOT_SNAP_APPS"
  app_dir4="$OTHER_APPS"

  # printf "searching for apps in... \n%s \n%s \n%s \n%s \n" "$app_dir" "$app_dir2" "$app_dir3" "$app_dir4"
  # use find -exec instead of for loop
  # https://man7.org/linux/man-pages/man1/find.1.html
  # find "$app_dir" -mindepth 2 -type f -name "*.desktop" -printf "%f \n" -exec grep -iP 'Exec=' \;
  # find "$app_dir" -mindepth 2 -type f -name "*.desktop"  -exec grep -iP "Exec=" "{}" \;
  # grep -iHPr "(Name|Exec)=" "$app_dir" --include="*.desktop"
  desktop_files "$app_dir"
  printf "\n"
  find "$app_dir2" -mindepth 2 -type f -name "*.desktop" -printf "%f \n"
  printf "\n\n"
  desktop_files "$app_dir4"
  # sudo find "$app_dir3" -mindepth 2 -type f -name "*.desktop" -printf "%f \n"
  desktop_files "$app_dir3"
  printf "\n"
  desktop_files "$app_dir2"
  # sudo find "$app_dir4" -mindepth 2 -type f -name "*.desktop" -printf "%f \n"
  printf "\n\n"
  # # for file in "$app_dir"/**/share/applications/*.desktop; do
  #   echo "$file"
  # done;
  # echo ""
}

cmd_name() {
  local cmd

  cmd=$(grep -iP "Exec=" "$1")
  printf "\n%s\n" "$cmd"
}

app_name() {
  local cmd

  cmd=$(grep -iP "Name=" "$1")
  printf "\n%s\n" "$cmd"
}

desktop_files() {
  find "$1" -mindepth 2 -type f -name "*.desktop" -print0 -execdir grep -iHPT "(Name|Exec)=" "{}" \;
}

get_desktops() {
  local dirs
  local apps
  apps="$(get_flatpak_apps)"

  echo "$apps"

}

get_flatpak_apps
# exit
# get_desktops; exit
