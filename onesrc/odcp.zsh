#!/bin/sh

# 📁 Default backup directory
DEFAULT="$HOME/backup/Onedrive"

# ✅ Check if gum is installed
if ! command -v gum &> /dev/null; then
  echo "❌ Gum is not installed. Please install it first: https://github.com/charmbracelet/gum"
  exit 1
fi

# 📍 Ask user where to store files
target=$(gum choose --header "🔍 Where do you want to store the files?" \
  "📁 Default folder ($DEFAULT)" \
  "🛠️  Enter custom directory" \
  "❌ Quit")

case "$target" in
  "📁 Default folder ($DEFAULT)")
    dir="$DEFAULT"
    ;;
  "🛠️  Enter custom directory")
    dir=$(gum input --placeholder "$HOME/your-folder" --prompt "📂 Enter target backup directory:")
    [ -z "$dir" ] && echo "👋 Exited by user." && exit 0
    dir="${dir/#\~/$HOME}"
    ;;
  "❌ Quit")
    echo "👋 Exited by user."
    exit 0
    ;;
  *)
    echo "⚠️ Invalid selection."
    exit 1
    ;;
esac

# 🗂️ Ask how to handle existing files
choice=$(gum choose --header "⚙️ How should existing files be handled?" \
  "1) 🚫 Skip existing files" \
  "2) ♻️ Overwrite if source is newer" \
  "3) 🔒 Never overwrite" \
  "4) 🪄 Rename duplicates (suffix _copy)" \
  "❌ Quit")

if [ "$choice" = "❌ Quit" ]; then
  echo "👋 Exited by user."
  exit 0
fi

# Set rclone flag
case "$choice" in
  "1) 🚫 Skip existing files") flag="--ignore-existing" ;;
  "2) ♻️ Overwrite if source is newer") flag="--update" ;;
  "3) 🔒 Never overwrite") flag="--no-overwrite" ;;
  "4) 🪄 Rename duplicates (suffix _copy)") flag="--suffix=_copy" ;;
  *) flag="--update" ;;
esac

# ✅ Confirm action
gum confirm "Ready to copy from 'onedrive:/' to '$dir' using flag '$flag'? Proceed?" || {
  echo "👋 Copy cancelled."
  exit 0
}

# Create target directory if needed
mkdir -p "$dir"

# 🚀 Start copy
gum spin --title "🚀 Copying from Onedrive..." -- rclone copy onedrive:/ "$dir" $flag

# ✅ Done
gum style --foreground 212 --border normal --padding "1 2" --margin "1 0" \
  -- "✅ Backup completed successfully at: $dir"
