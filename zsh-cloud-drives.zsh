#!/bin/sh

FUNCTION_SRC="${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/zsh-cloud-drives/functions"

# Load functions
for file in $FUNCTION_SRC/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done
