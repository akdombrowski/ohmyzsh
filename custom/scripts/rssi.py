#!/usr/bin/env python3
import subprocess
import re
import time

# Replace with your Pixel Buds 2 MAC
TARGET_MAC = "FC:91:5D:70:1B:23".lower()

def rssi_bar(rssi):
    # Convert -100..0 dBm into a 50-character bar
    bars = max(0, min(50, (100 + rssi)//2))
    return "#" * bars + "-" * (50 - bars)

print("Make sure your Pixel Buds 2 are in pairing mode (LED flashing white)")
print("Press Ctrl+C to exit\n")

proc = subprocess.Popen(
    ["sudo", "btmon"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
)

last_mac = None

try:
    for line in proc.stdout:
        line = line.strip()

        # Track the MAC address in the advertising report
        mac_match = re.search(r'Address: ([0-9A-F:]{17})', line, re.I)
        if mac_match:
            last_mac = mac_match.group(1).lower()

        # If RSSI line and MAC matches, print live bar
        rssi_match = re.search(r'RSSI:\s*(-?\d+)\s*dBm', line)
        if rssi_match and last_mac == TARGET_MAC:
            rssi = int(rssi_match.group(1))
            print(f"\rRSSI: {rssi:4d} dBm | {rssi_bar(rssi)}", end="", flush=True)
except KeyboardInterrupt:
    proc.terminate()
    print("\nExiting...")
