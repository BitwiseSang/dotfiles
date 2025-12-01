#!/usr/bin/env bash
# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting config backup..."

# Get the absolute path to the directory where this script is located (the repo root)
REPO_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo "Repo root found at: $REPO_ROOT"
echo "Copying local configs into repo..."

# --- Alacritty ---
# Ensure the target directory exists
mkdir -p "$REPO_ROOT/alacritty"
# Copy the file
cp -f ~/.config/alacritty/alacritty.toml "$REPO_ROOT/alacritty/alacritty.toml"
echo "Backed up alacritty.toml"

# --- tmux ---
# Ensure the target directory exists
mkdir -p "$REPO_ROOT/tmux"
# Copy the file
cp -f ~/.tmux.conf "$REPO_ROOT/tmux/tmux.conf"
echo "Backed up tmux.conf"

# --- gitmux ---
# Ensure the target directory exists
mkdir -p "$REPO_ROOT/gitmux"
# Copy the file
cp -f ~/.gitmux.conf "$REPO_ROOT/gitmux/gitmux.conf"
echo "Backed up gitmux.conf"

# --- Starship ---
# Ensure the target directory exists
mkdir -p "$REPO_ROOT/starship"
# Copy the file
cp -f ~/.config/starship.toml "$REPO_ROOT/starship/starship.toml"
echo "Backed up starship.toml"

# --- nvim ---
# Ensure the target directory exists
mkdir -p "$REPO_ROOT/nvim"
# Use rsync to sync the contents of your nvim config into the repo's nvim dir
# -a: archive mode (recursive, preserves permissions, etc.)
# --delete: deletes files in the repo's nvim/ dir that are NO longer in your local ~/.config/nvim/
echo "Syncing nvim configs..."
rsync -a --delete ~/.config/nvim/ "$REPO_ROOT/nvim/"
echo "Nvim sync complete."


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
