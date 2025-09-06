#!/usr/bin/env bash

export SSH_CONFIG="$HOME/.ssh/config"

# Make sure ~/.ssh exists
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Create config file if it doesn't exist
if [ ! -f "$SSH_CONFIG" ]; then
    touch "$SSH_CONFIG"
    chmod 600 "$SSH_CONFIG"
fi

# Add GitHub entry if not present
if ! grep -q "Host github.com" "$SSH_CONFIG"; then
cat << 'EOF' >> "$SSH_CONFIG"

# GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_github
    IdentitiesOnly yes
EOF
fi

# Add nixbox entry if not present
if ! grep -q "Host nixbox" "$SSH_CONFIG"; then
cat << 'EOF' >> "$SSH_CONFIG"

# Local nix box
Host nixbox
    HostName nix.local
    User yourusername
    IdentityFile ~/.ssh/id_ed25519_nix
    IdentitiesOnly yes
EOF
fi

echo "✅ SSH config updated at $SSH_CONFIG"