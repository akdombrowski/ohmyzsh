#!/usr/bin/env bash

export AHHEM="/mnt/ahhem"
export E="ahheme"
export D="ahhemd"
export C="ahhemc"
export F="ahhemf"

# get count of mp4's in folder given by argument "$1"
# echo "# get count of mp4's in folder given by argument \"$1\""
# echo "ls -R \"$1\" | sort -g | uniq | grep -Pe \".*\.mp4\" | wc -l"

# list all available smb shares from host
# echo "# list all available smb shares from host"
# echo "smbclient -L 192.168.86.15 -U \"username%password\""

# Auto-mount LennyDesk share if not already mounted
if ! mountpoint -q "${AHHEM}/${D}"; then
    sudo mount -t cifs "//192.168.86.$LENNYDESK/ahhem" "${AHHEM}/${D}" \
      -o $(cat "$HOME/.lennydesk")
fi

# Auto-mount LennyDesk share if not already mounted
if ! mountpoint -q "${AHHEM}/${E}"; then
    sudo mount -t cifs "//192.168.86.$LENNYDESK/ahheme" "${AHHEM}/${E}" \
      -o $(cat "$HOME/.lennydesk")
fi

# Auto-mount LennyDesk share if not already mounted
if ! mountpoint -q "${AHHEM}/${F}"; then
    sudo mount -t cifs "//192.168.86.$LENNYDESK/ahhemf" "${AHHEM}/${F}" \
      -o $(cat "$HOME/.lennydesk")
fi