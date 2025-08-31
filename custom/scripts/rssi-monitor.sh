#!/bin/bash

while true; do
  rssi=$(bluetoothctl info <MAC> | grep RSSI | awk '{print $2}')
  bars=$(( (100 + rssi) / 2 ))
  printf "\rRSSI: %4s dBm | %-50s" "$rssi" "$(head -c $bars < /dev/zero | tr '\0' '#')"
  sleep 0.5
done
