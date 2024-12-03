#!/usr/bin/env bash

nvbz() {
  find "$NVB_FILES" -P ".nvidia-settings" printf "%f"
}

nvbs() {
  ls "$NVB_FILES"/.nvidia-settings*
}

nvbl() {
  local config_file
  config_file="$NVB_FILES/.nvidia-settings-rc${1:+_$1}"
  nvidia-settings -l --config="$config_file"
}

nvb() {
  local config_file
  config_file="$NVB_FILES/.nvidia-settings-rc${1:+_$1}"
  nvidia-settings --config="$config_file"
}
