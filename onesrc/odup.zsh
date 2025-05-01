#!/bin/sh

# ✅ Check if gum is installed
if ! command -v gum &> /dev/null; then
  echo "❌ Gum is not installed. Please install it first: https://github.com/charmbracelet/gum"
  exit 1
fi

# 📂 Ask for local folder or quit
folderl=$(gum input --placeholder "~/Documents/my-folder" --prompt "📤 Enter the local folder to upload (or leave empty to quit):")
if [ -z "$folderl" ]; then
  echo "👋 Exited by user."
  exit 0
fi
folderl="${folderl/#\~/$HOME}"

# ❓ Ask how to handle existing files
choice=$(gum choose --header "🗂️ How should existing files be handled?" \
  "1) 🚫 Skip existing files" \
  "2) ♻️ Overwrite if source is newer" \
  "3) 🔒 Never overwrite" \
  "4) 🪄 Rename duplicates (suffix _copy)" \
  "❌ Quit")

if [ "$choice" = "❌ Quit" ]; then
  echo "👋 Exited by user."
  exit 0
fi

# 🎛️ Set rclone flag
case "$choice" in
  "1) 🚫 Skip existing files") flag="--ignore-existing" ;;
  "2) ♻️ Overwrite if source is newer") flag="--update" ;;
  "3) 🔒 Never overwrite") flag="--no-overwrite" ;;
  "4) 🪄 Rename duplicates (suffix _copy)") flag="--suffix=_copy" ;;
  *) flag="--update" ;;
esac

# 🎯 Ask for target folder or quit
foldert=$(gum input --placeholder "my-drive-folder" --prompt "🎯 Enter the target folder on Onedrive (or leave empty to quit):")
if [ -z "$foldert" ]; then
  echo "👋 Exited by user."
  exit 0
fi

# ✅ Confirm before upload
gum confirm "Ready to upload '$folderl' to 'onedrive:$foldert' with flag '$flag'? Proceed?" || {
  echo "👋 Upload cancelled."
  exit 0
}

# 🚀 Upload with rclone
gum spin --title "🚀 Uploading to Onedrive..." -- rclone copy "$folderl" onedrive:"$foldert" $flag

# ✅ Done
gum style --foreground 212 --border normal --padding "1 2" --margin "1 0" \
  -- "✅ Upload completed successfully to onedrive:$foldert"
