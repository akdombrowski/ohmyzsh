local os="$(uname -sro)"
export ALIASES_DIR="$ZSH/custom/aliases"

source $ALIASES_DIR/common_aliases.zsh

if [[ ${os} =~ "[lL]inux" ]]; then
  source $ALIASES_DIR/mint_aliases.zsh
  # cat $ALIASES_DIR/mint_aliases.txt
else
  source $ALIASES_DIR/win_aliases.zsh
  # cat $ALIASES_DIR/win_aliases.txt
fi
