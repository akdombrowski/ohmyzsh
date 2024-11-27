#!/bin/sh

export HOME_CINNAMON_DIR="$HOME/Cinnamon"

nvbs() {
  ls "$HOME_CINNAMON_DIR"/.nvidia-settings*
}

nvb() {
  local config_file
  config_file="$HOME_CINNAMON_DIR/.nvidia-settings-rc${1:+_$1}"
  nvidia-settings -l --config="$config_file" -V "all"
}
