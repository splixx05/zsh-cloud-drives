SRC="${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/zsh-cloud-drives/odsrc"

function :cp-onedrive ()
{
 if [[ -n $TMUX ]]; then
   tmux new-window -n phone "$SRC/odcp.zsh"
 else
$SRC/odcp.zsh
 fi
}


function :mnt-onedrive ()
{
 if [[ -n $TMUX ]]; then
   tmux new-window -n usb "$SRC/odmnt.zsh"
 else
$SRC/odmnt.zsh
 fi
}


function :up-onedrive ()
{
 if [[ -n $TMUX ]]; then
   tmux new-window -n usb "$SRC/odup.zsh"
 else
$SRC/odup.zsh
 fi
}
