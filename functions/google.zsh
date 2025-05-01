
SRC="${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/zsh-cloud-drives/gdsrc"

function :cp-gdrive ()
{
 if [[ -n $TMUX ]]; then
   tmux new-window -n phone "$SRC/gdcp.zsh"
 else
$SRC/gdcp.zsh
 fi
}


function :mnt-gdrive ()
{
 if [[ -n $TMUX ]]; then
   tmux new-window -n usb "$SRC/gdmnt.zsh"
 else
$SRC/gdmnt.zsh
 fi
}



function :up-gdrive ()
{
 if [[ -n $TMUX ]]; then
   tmux new-window -n usb "$SRC/gdup.zsh"
 else
$SRC/gdup.zsh
 fi
}
