#!/usr/bin/env bash
# This script sets up the dotfiles by creating symbolic links
# from the repo to your home directory.

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting dotfile setup..."

# Get the absolute path to the directory where this script is located (the repo root)
REPO_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Repo root found at: $REPO_ROOT"

# Create a timestamped backup directory for any existing configs
BACKUP_DIR="$HOME/.dotfile_backups_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "Any existing configs will be backed up to $BACKUP_DIR"

# Helper function to create symlinks
# Usage: link_config "source_path_in_repo" "destination_path_in_home"
link_config() {
    local src="$REPO_ROOT/$1"
    local dest="$HOME/$2"
    local dest_dir=$(dirname "$dest")

    # Ensure the source file/dir actually exists in the repo
    if [ ! -e "$src" ]; then
        echo "WARNING: Source not found: $src. Skipping."
        return
    fi

    # Create the destination directory (e.g., ~/.config/alacritty) if it doesn't exist
    mkdir -p "$dest_dir"

    # If the destination already exists (as a file, dir, or symlink), back it up
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "  -> Backing up existing config: $dest"
        mv "$dest" "$BACKUP_DIR/"
    fi

    # Create the new symbolic link
    echo "  -> Linking: $src -> $dest"
    ln -s "$src" "$dest"
}

# --- Link Configurations ---

# Alacritty
link_config "alacritty/alacritty.toml" ".config/alacritty/alacritty.toml"

# tmux
link_config "tmux/tmux.conf" ".tmux.conf"

# gitmux
link_config "gitmux/gitmux.conf" ".gitmux.conf"

# Starship
link_config "starship/starship.toml" ".config/starship.toml"

# nvim (linking the whole directory)
link_config "nvim" ".config/nvim"

echo ""
echo "Dotfile setup complete!"
echo "Old configs (if any) are in $BACKUP_DIR"
