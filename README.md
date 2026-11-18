# Dotfiles

Personal configuration files for Linux tools.

> Use at your own risk!
> Don't use blindly, check first if it aligns with what you want.

## Helper Scripts

- **`setup.sh`**: Creates symbolic links from this repository to your home
  directory, backing up any existing files first.
- **`backup.sh`**: Copies active local configurations into this repository,
  creates a timestamped git commit, and pushes to remote.

## Installation

Clone the repository and run the setup script:

```shell
git clone git@github.com:BitwiseSang/dotfiles.git
cd dotfiles
chmod +x setup.sh && ./setup.sh
```

> The `backup.sh` scripts backs up your existing configurations first, so you
> can use it to test the configurations first.

## Backing Up Changes

To sync local configurations into the repository and push:

```shell
chmod +x backup.sh && ./backup.sh
```
