# -------------- Google Drive --------------------
function cp-gdrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local gdcp_script="$script_dir/gdscr/gdcp.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$gdcp_script"
  else
    "$gdcp_script"
  fi
}

function mnt-gdrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local gdmnt_script="$script_dir/gdscr/gdmnt.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$gdmnt_script"
  else
"$gdmnt_script"
  fi
}

function up-gdrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local gdup_script="$script_dir/gdscr/gdup.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$gdup_script"
  else
"$gdup_script"
  fi
}

# -------------- One Drive --------------------

function cp-onedrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local odcp_script="$script_dir/onescr/odcp.sh"

  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$odcp_script"
  else
"$odcp_script"
  fi
}

function mnt-onedrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local odmnt_script="$script_dir/onescr/odmnt.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$odmnt_script"
  else
"$odmnt_script"
  fi
}

function up-onedrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local odup_script="$script_dir/onescr/odup.sh"

  if [[ -n $TMUX ]]; then
    tmux new-window -n onedrive "$odup_script"
  else
"$odup_script"
  fi
}
