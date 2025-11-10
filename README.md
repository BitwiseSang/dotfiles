# My Dotfiles

A simple repository to store and manage my personal configuration files.

## 🗂️ Contents

This repository contains my personal configurations for the following tools:

* **`alacritty/`**: Configs for the Alacritty terminal emulator.
* **`nvim/`**: Configs for Neovim.
* **`tmux/`**: Configs for tmux.

### Scripts

* **`setup.sh`**: A script to install these dotfiles (likely by creating
symbolic links) on a new system.
* **`backup.sh`**: A script to copy my local, in-use configurations *back into*
this repository to be committed.

## 🚀 Installation

**Warning**: These are my personal configs. Use at your own risk, or fork and
adapt them for your own use.

1. Clone the repository: ```git clone <your-repo-url> cd <repo-name>```

2. Make the script executable (if needed) and run it: ```chmod +x setup.sh
./setup.sh```

## 💾 Backing Up Local Changes

When I make changes to my configs on my machine, I run the backup script to copy
them into this repo before committing.

1. Run the backup script: ```./backup.sh```. This will backup your configs,
   commit them, and push them.
2. Enter your ssh key, if any, to push your changes.
