#!/bin/sh

SRC="${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/zsh-cloud-drives/functions"

# Load functions
for file in SCR/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done

