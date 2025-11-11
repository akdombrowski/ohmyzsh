#!/usr/bin/env bash

export PATH="$PATH:/usr/lib/wsl/lib"

# asus windows laptop paths from WSL
export DRIVE_D='/mnt/d'
export DRIVE_C='/mnt/c'
export AKDFL="${DRIVE_C}/akdfl"
export D_AKDFL="${DRIVE_D}/D_akdfl"]
export ADOMBROWSKI="${DRIVE_C}/Users/akdfl"
export LOGS_DIR="$HOME/logs"
export WSL_PATHS=("DRIVE_D" "DRIVE_C" "AKDFL" "ADOMBROWSKI" "LOGS_DIR")

export WIN_USER=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command '[Environment]::UserName' 2>/dev/null | tr -d '\r')
export WIN_HOME="/mnt/c/Users/$WIN_USER"