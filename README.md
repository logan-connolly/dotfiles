# Dotfiles

⚠️ **Warning:** use at your own risk.

## Prerequisites

Fresh minimal installation of [Arch](https://archlinux.org/).

## Installation

```shell
# Clone dotfiles repo
git clone https://github.com/logan-connolly/dotfiles.git && cd dotfiles

# Install system dependencies
make system

# Install gnome desktop environment
make gnome-desktop

# Clone repos that cannot be installed by pacman
make clone

# Link configurations to target destinations
make links

# Install neovim from source and sync plugins
make neovim

# Sync application configurations
make config

# Enable services, add groups to user and setup firewall
make services
```

## Troubleshooting

#### Failed to commit transaction

When installing pacman packages after a fresh install, it can be that the encryption keys are not up-to-date. Solve this by running the following command `sudo pacman-key --refresh-keys`
