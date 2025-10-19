function cp-gdrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local gdcp_script="$script_dir/gdcp.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$gdcp_script"
  else
    "$gdcp_script"
  fi
}

function mnt-gdrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local gdmnt_script="$script_dir/gdmnt.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$gdmnt_script"
  else
"$gdmnt_script"
  fi
}

function up-gdrive() {
  local script_dir="${${(%):-%x}:A:h}"
  local gdup_script="$script_dir/gdup.sh"
  
  if [[ -n $TMUX ]]; then
    tmux new-window -n google "$gdup_script"
  else
"$gdup_script"
  fi
}
