#!/usr/bin/env bash

nvbz() {
  # find "$NVB_SETTINGS" -name ".nvidia-settings" printf "%f"
  find "$NVB_SETTINGS" -name ".nvidia-settings-rc_*" -print
}

nvbs() {
  ls -1 "$NVB_SETTINGS"
}

# -l, --load-config-only
#     Load the configuration file, send the values specified therein to the X server, and exit.  This mode of
#     operation is useful to place in your xinitrc file, for example.
nvbl() {
  local config_file
  config_file="$NVB_SETTINGS/.nvidia-settings-rc${1:+_$1}"
  nvidia-settings -l --config="$config_file"
}

nvb() {
  local config_file
  config_file="$NVB_SETTINGS/.nvidia-settings-rc${1:+_$1}"
  nvidia-settings --config="$config_file"
}
