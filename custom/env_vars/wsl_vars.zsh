#!/usr/bin/env zsh

export PATH="$PATH:/usr/lib/wsl/lib"

# asus windows laptop paths from WSL
export DRIVE_D='/mnt/d'
export DRIVE_C='/mnt/c'
export AKDFL="${DRIVE_C}/akdfl"
export D_AKDFL="${DRIVE_D}/D_akdfl"
export PICS="${AKDFL}/D_Pictures"
export ANTHONY_PICS="${PICS}/anthony"
export KAPTCHA_ME_PICS="${PICS}/kaptcha-me"
export STOCK_PICS="${PICS}/stock-imgs"
export ICONS_PICS="${STOCK_PICS}/icons"
export CAR_PICS="${PICS}/car"
export VIDS="${AKDFL}/D_Videos"
export DOCS="${AKDFL}/A_Documents"
export D_MUSIC="${AKDFL}/DMusic"
export DOWNLOADS="${AKDFL}/DDownloads"
export D_AUDIO="${AKDFL}/audio"
export ADOMBROWSKI="${DRIVE_C}/Users/akdfl"
export WSL_PATHS=("DRIVE_D" "DRIVE_C" "AKDFL" "PICS" "ANTHONY_PICS" "KAPTCHA_ME_PICS" "STOCK_PICS" "ICONS_PICS" "CAR_PICS" "VIDS" "DOCS" "A_MUSIC" "DOWNLOADS" "A_AUDIO" "ADOMBROWSKI")
export LOGS_DIR="$HOME/logs"

export WIN_USER=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command '[Environment]::UserName' 2>/dev/null | tr -d '\r')
export WIN_HOME="/mnt/c/Users/$WIN_USER"