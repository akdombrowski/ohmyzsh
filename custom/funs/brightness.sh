#!/bin/bash

get_configs() {
  ls ~/Cinnamon/.nvidia-settings*
}

set() {
  nvidia-settings --load-config-only --config="~/.nvidia-settings-rc${1:+_$1}"

}

test() {
  echo "${1:+_$1}"
}
