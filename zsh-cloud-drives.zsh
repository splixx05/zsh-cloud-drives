#!/bin/sh

FUNCTION="${ZSH:-$HOME/.zsh}/plugins/local/zsh-cloud-drives/functions"

# Load functions
for file in $FUNCTION/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done
