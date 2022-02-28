# Dotfiles

⚠️ **Warning:** use at your own risk.

## Prerequisites

Fresh install of [arch](https://archlinux.org/) using [bootstrap-arch](https://github.com/logan-connolly/bootstrap-arch).

## Installation

```shell
# Clone dotfiles repo
git clone https://github.com/logan-connolly/dotfiles.git && cd dotfiles

# Install system dependencies
make system

# Install desktop environment
make desktop

# Clone repos that cannot be installed by pacman
make clone

# Link configurations to target destinations
make links

# Install neovim from source and add plugins through paq
make neovim
make paq

# Enable services, add groups to user and setup firewall
make services
```

## Troubleshooting

#### Failed to commit transaction

When installing pacman packages after a fresh install, it can be that the encryption keys are not up-to-date. Solve this by running the following command `sudo pacman-key --refresh-keys`
