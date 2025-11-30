#!/usr/bin/env bash

LENNYDESK_IP="//192.168.86.$LENNYDESK"
LENNYDESK_AHHEM="$LENNYDESK_IP/ahhem"
LENNYDESK_AHHEME="$LENNYDESK_IP/ahheme"
LENNYDESK_AHHEMF="$LENNYDESK_IP/ahhemf"
HOME_LENNYDESK="$HOME/.lennydesk"

export AHHEM="/mnt/ahhem"
export E="ahheme"
export D="ahhemd"
export C="ahhemc"
export F="ahhemf"

# get count of mp4's in folder given by argument "$1"
# echo "# get count of mp4's in folder given by argument \"$1\""
# echo "ls -R \"$1\" | sort -g | uniq | grep -Pe \".*\.mp4\" | wc -l"
# numberOfMp4s=$(ls -R . | sort -g | uniq | grep -P "\.mp4" | wc -l)
count() {
  numberOfMp4s=$(ls -R . | sort -g | uniq | grep -P "\.mp4" | wc -l)
  echo $numberOfMp4s
}

# list all available smb shares from host
# echo "# list all available smb shares from host"
# echo "smbclient -L 192.168.86.15 -U \"username%password\""

mount() {
  sudo mount --onlyonce -m -t cifs "//192.168.86.$LENNYDESK/ahhem" "${AHHEM}/${D}" \
    -o $(cat "$HOME_LENNYDESK")
  sudo mount --onlyonce -m -t cifs "//192.168.86.$LENNYDESK/ahheme" "${AHHEM}/${E}" \
    -o $(cat "$HOME_LENNYDESK")
  sudo mount --onlyonce -m -t cifs "//192.168.86.$LENNYDESK/ahhemf" "${AHHEM}/${F}" \
    -o $(cat "$HOME_LENNYDESK")
}

a_hhem_uto_mnt() {
  # Auto-mount LennyDesk share if not already mounted
  arg1="$1"
  arg2="$2"
  if ! mountpoint -q "${arg1}"; then
    sudo mount --onlyonce -m -t cifs "$LENNYDESK_AHHEM" "$arg1" \
      -o $(cat "$HOME_LENNYDESK")
  fi
}

auto_mnt() {
  # Auto-mount LennyDesk share if not already mounted
  mnt_path="$1"
  smb_path="$2"
  if ! mountpoint -q "${arg1}"; then
    sudo mount --onlyonce -m -t cifs "$smb_path" "$mnt_path" \
      -o $(cat "$HOME_LENNYDESK")
  fi
}

# # Auto-mount LennyDesk share if not already mounted
# if ! mountpoint -q "${AHHEM}/${D}"; then
#     sudo mount --onlyonce -m -t cifs "//192.168.86.$LENNYDESK/ahhem" "${AHHEM}/${D}" \
#       -o $(cat "$HOME_LENNYDESK")
# fi

# # Auto-mount LennyDesk share if not already mounted
# if ! mountpoint -q "${AHHEM}/${E}"; then
#     sudo mount -m -t cifs "//192.168.86.$LENNYDESK/ahheme" "${AHHEM}/${E}" \
#       -o $(cat "$HOME_LENNYDESK")
# fi

# # Auto-mount LennyDesk share if not already mounted
# if ! mountpoint -q "${AHHEM}/${F}"; then
#     sudo mount -m -t cifs "//192.168.86.$LENNYDESK/ahhemf" "${AHHEM}/${F}" \
#       -o $(cat "$HOME_LENNYDESK")
# fi

auto_mnt "${AHHEM}/${D}" "$LENNYDESK_AHHEM"
auto_mnt "${AHHEM}/${E}" "$LENNYDESK_AHHEME"
auto_mnt "${AHHEM}/${F}" "$LENNYDESK_AHHEMF"
auto_mnt "/mnt/H" "$LENNYDESK_IP/SeagateH"
auto_mnt "/mnt/W" "$LENNYDESK_IP/WD Elements"

echo ""
echo "mounts:"
echo "${AHHEM}/${D} > $LENNYDESK_AHHEM"
echo "${AHHEM}/${E} > $LENNYDESK_AHHEME"
echo "${AHHEM}/${F} > $LENNYDESK_AHHEMF"
echo "/mnt/H > $LENNYDESK_IP/SeagateH"
echo "/mnt/H > $LENNYDESK_IP/WD Elements"
echo ""
