#!/usr/bin/env bash
# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting config backup..."

# Get the absolute path to the directory where this script is located (the repo root)
REPO_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

echo "Repo root found at: $REPO_ROOT"
echo "Copying local configs into repo..."

# Helper to safely copy if file exists
safe_copy() {
  local src="$1"
  local dest="$2"
  if [ -f "$src" ]; then
    mkdir -p "$(dirname "$dest")"
    cp -f "$src" "$dest"
    echo "Backed up $(basename "$dest")"
  fi
}

# --- ghostty ---
if [ -f ~/.config/ghostty/config ]; then
  safe_copy ~/.config/ghostty/config "$REPO_ROOT/ghostty/config.ghostty"
elif [ -f ~/.config/ghostty/config.ghostty ]; then
  safe_copy ~/.config/ghostty/config.ghostty "$REPO_ROOT/ghostty/config.ghostty"
fi

# --- kitty ---
safe_copy ~/.config/kitty/kitty.conf "$REPO_ROOT/kitty/kitty.conf"

# --- tmux ---
safe_copy ~/.tmux.conf "$REPO_ROOT/tmux/tmux.conf"

# --- gitmux ---
safe_copy ~/.gitmux.conf "$REPO_ROOT/gitmux/gitmux.conf"

# --- starship ---
safe_copy ~/.config/starship.toml "$REPO_ROOT/starship/starship.toml"

# --- clang-format ---
safe_copy ~/.clang-format "$REPO_ROOT/clang-format/.clang-format"

# --- aria2 ---
if [ -f ~/.config/aria2/aria2.conf ]; then
  safe_copy ~/.config/aria2/aria2.conf "$REPO_ROOT/aria2/aria2.conf"
elif [ -f ~/aria2.conf ]; then
  safe_copy ~/aria2.conf "$REPO_ROOT/aria2/aria2.conf"
fi

# --- nvim ---
mkdir -p "$REPO_ROOT/nvim"
echo "Syncing nvim configs..."
rsync -a --delete ~/.config/nvim/ "$REPO_ROOT/nvim/"
echo "Nvim sync complete."

# --- doom ---
mkdir -p "$REPO_ROOT/doom"
echo "Syncing doom configs..."
rsync -a --delete ~/.config/doom/ "$REPO_ROOT/doom/"
echo "Doom sync complete."

# --- fish ---
mkdir -p "$REPO_ROOT/fish"
echo "Syncing fish configs..."
rsync -a --delete ~/.config/fish/ "$REPO_ROOT/fish/"
echo "Fish sync complete."

echo "Files copied. Committing to git..."

# Navigate to the repo directory to run git commands
cd "$REPO_ROOT"

# Check if there are any changes to commit
if [[ -z $(git status --porcelain) ]]; then
  echo "No changes detected. Backup complete."
  exit 0
fi

# Get metadata for commit message
date_time=$(date "+%Y-%m-%d at %H:%M:%S")
device_name=$(hostname)

# Add, commit, and push
git add .
git commit -m "Config backup on $date_time from $device_name"
git push

echo "Backup complete and pushed to remote!"
