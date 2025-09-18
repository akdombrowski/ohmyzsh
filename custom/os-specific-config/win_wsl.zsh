#!/usr/bin/env bash


source $ALIASEZ/wsl_aliases.zsh
source "$ENV_VARS_DIR/wsl_vars.zsh"

# enable shell autocompletion for uv and uvx commands
echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc
