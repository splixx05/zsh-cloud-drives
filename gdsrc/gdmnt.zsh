#!/bin/sh

# 📁 Default mount point
DEFAULT="$HOME/ex/GDrive"

# ✅ Check if gum is installed
if ! command -v gum &> /dev/null; then
  echo "❌ Gum is not installed. Please install it first: https://github.com/charmbracelet/gum"
  exit 1
fi

# 📍 Ask user where to mount
target=$(gum choose --header "🔍 Where do you want to mount Google Drive?" \
  "📁 Default mount point ($DEFAULT)" \
  "🛠️  Enter custom mount point" \
  "❌ Quit")

case "$target" in
  "📁 Default mount point ($DEFAULT)")
    dir="$DEFAULT"
    gum confirm "Google Drive will be mounted at: $dir. Proceed?" || exit 0
    ;;
  "🛠️  Enter custom mount point")
    dir=$(gum input --placeholder "$HOME/your-folder" --prompt "Enter mount path: ")
    # Replace ~ with $HOME
    dir="${dir/#\~/$HOME}"
    gum confirm "Google Drive will be mounted at: $dir. Proceed?" || exit 0
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

# 📁 Ensure the mount point exists
mkdir -p "$dir"

# 🚀 Start mounting with rclone
gum spin --title "🚀 Mounting Google Drive..." -- rclone mount gdrive:/ "$dir" &

# 🟢 Done message
gum style --foreground 212 --border normal --padding "1 2" --margin "1 0" \
  -- "✅ Google Drive mounted successfully to: $dir"

# ⏳ Optional: show how to unmount
gum style --foreground 245 --italic --margin "0 0" \
  "💡 Press Ctrl+C in this terminal or kill the background process to unmount."
