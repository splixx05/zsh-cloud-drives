
local scr="${${(%):-%x}:A:h}/src"

for script in $scr/*/*.zsh; do
  [[ -f "$script" ]] && source "$script"
done
