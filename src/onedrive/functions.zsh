function cp-onedrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local odcp_script="$script_dir/odcp.sh"

  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$odcp_script"
  else
"$odcp_script"
  fi
}

function mnt-onedrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local odmnt_script="$script_dir/odmnt.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$odmnt_script"
  else
"$odmnt_script"
  fi
}

function up-onedrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local odup_script="$script_dir/odup.sh"

  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$odup_script"
  else
"$odup_script"
  fi
}
