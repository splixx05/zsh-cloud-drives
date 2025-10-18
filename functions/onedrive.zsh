OSRC="${ZSH:-$HOME/.zsh}/plugins/local/zsh-cloud-drives/onesrc"

function cp-onedrive() {
  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$OSRC/odcp.zsh"
  else
    $OSRC/odcp.zsh
  fi
}

function mnt-onedrive() {
  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$OSRC/odmnt.zsh"
  else
    $OSRC/odmnt.zsh
  fi
}

function up-onedrive() {
  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$OSRC/odup.zsh"
  else
    $OSRC/odup.zsh
  fi
}
