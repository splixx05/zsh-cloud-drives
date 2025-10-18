GSRC="${ZSH:-$HOME/.zsh}/plugins/local/zsh-cloud-drives/gdsrc"

function cp-gdrive() {
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$GSRC/gdcp.zsh"
  else
    $GSRC/gdcp.zsh
  fi
}

function mnt-gdrive() {
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$GSRC/gdmnt.zsh"
  else
    $GSRC/gdmnt.zsh
  fi
}

function up-gdrive() {
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$GSRC/gdup.zsh"
  else
    $GSRC/gdup.zsh
  fi
}
