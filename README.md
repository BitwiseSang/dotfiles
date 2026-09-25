# Dotfiles

Personal configuration files for Linux terminal workflows, tuned for performance and accessibility.

## Components

- **`nvim/`**: Neovim configuration based on LazyVim. Includes LSP support, debugging (DAP), testing (Neotest for Vitest, RSpec, pytest), symbol outlines (Aerial), git diffs (Diffview), and system clipboard integration.
- **`tmux/`**: Tmux configuration with Catppuccin Mocha theme, true color and undercurl support, and seamless `Ctrl+h/j/k/l` pane navigation shared with Neovim.
- **`kitty/`**: Kitty terminal configuration with Fira Code and Nerd Font glyph mapping.
- **`ghostty/`**: Ghostty terminal configuration.
- **`fish/`**: Fish shell configuration integrated with hydro, mise, fnm, and zoxide.
- **`clang-format/`**: Formatting rules for C and C++.
- **`aria2/`**: Configuration for the aria2 download utility.

## Helper Scripts

- **`setup.sh`**: Creates symbolic links from this repository to your home directory, backing up any existing files first.
- **`backup.sh`**: Copies active local configurations into this repository, creates a timestamped git commit, and pushes to remote.

## Installation

Clone the repository and run the setup script:

```shell
git clone git@github.com:BitwiseSang/dotfiles.git
cd dotfiles
chmod +x setup.sh && ./setup.sh
```

## Backing Up Changes

To sync local configurations into the repository and push:

```shell
chmod +x backup.sh && ./backup.sh
```
