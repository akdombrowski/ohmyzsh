#!/usr/bin/env bash

# Directory in Windows to store keys
WIN_USER=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command '[Environment]::UserName' 2>/dev/null | tr -d '\r')
WIN_HOME="/mnt/c/Users/$WIN_USER"
echo "detected win username: $WIN_USER"



WIN_SSH_DIR="/mnt/c/Users/$WIN_USER/.ssh"

# Check if the directory exists
if [ ! -d "$WIN_SSH_DIR" ]; then
    # create dir if doesn't exist, or, more precisely, ignore error if dir already exists (-p flag)
    mkdir -p "$WIN_SSH_DIR"
    if [ $? -eq 0 ]; then
        echo "✅ Created Windows .ssh directory at $WIN_SSH_DIR"
    else
        echo "❌ Failed to create Windows .ssh directory at $WIN_SSH_DIR" >&2
        exit 1
    fi
fi

mkdir -vp "$WIN_SSH_DIR"

# Generate a short unique suffix (timestamp + random)
UNIQ_SUFFIX=$(date +%Y%m%d%H%M%S)-$RANDOM

# Use first argument as key name; fallback to id_ed25519-<suffix>
KEY_NAME="${1:-id_ed25519-$UNIQ_SUFFIX}"

# Full path in Windows
KEY_PATH="$WIN_SSH_DIR/$KEY_NAME"

# Optional comment for key
KEY_COMMENT="${2:-$USER@wsl}"

# Generate the SSH key in Windows folder
ssh-keygen -t ed25519 -f "$KEY_PATH" -C "$KEY_COMMENT" "$@"

# Add key to Windows ssh-agent
/c/Windows/System32/OpenSSH/ssh-add.exe "$KEY_PATH"

# Symlink in WSL ~/.ssh so Linux tools can find it
mkdir -p ~/.ssh
ln -sf "$KEY_PATH" ~/.ssh/"$KEY_NAME"
ln -sf "$KEY_PATH.pub" ~/.ssh/"$KEY_NAME.pub"

echo "✅ Key created: $KEY_PATH"
echo "✅ Symlinked to WSL: ~/.ssh/$KEY_NAME"
echo "✅ Added to Windows ssh-agent"
