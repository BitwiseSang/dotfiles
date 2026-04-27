# My Dotfiles

A simple repository to store and manage my personal configuration files.

## Contents

This repository contains my personal configurations for the following tools:

- **`nvim/`**: Configs for Neovim.
- **`tmux/`**: Configs for tmux.
- **`starship/`**: Configs for starship prompt.
- **`aria2/`**: Configs for aria2.
- **`clang-format/`**: formatting options for clang-format.

### Scripts

- **`setup.sh`**: A script to install these dotfiles by creating
  symbolic links on a new system.
- **`backup.sh`**: A script to copy local, in-use configurations _back into_
  this repository to be committed.

## Installation

**Warning**: These are my personal configs. Use at your own risk, or fork and
adapt them for your own use.

1. Clone the repository:

```
git@github.com:BitwiseSang/dotfiles.git
```

1. Make the script executable (if needed) and run it:

```shell
chmod +x setup.sh && ./setup.sh
```

## Backing Up Local Changes

When I make changes to my configs on my machine, I run the backup script to copy
them into this repo before committing.

1. Run the backup script: `./backup.sh`. This will backup your configs,
   commit them, and push them.
2. Enter your ssh key, if any, to push your changes.
