# Dotfiles

⚠️ **Warning:** use at your own risk.

## Prerequisites

Fresh install of [arch](https://archlinux.org/) using [bootstrap-arch](https://github.com/logan-connolly/bootstrap-arch).

## Installation

```shell
# Clone dotfiles repo
git clone https://github.com/logan-connolly/dotfiles.git && cd dotfiles

# Install system and desktop environment dependencies through pacman
make install pkg_file=scripts/pacman/system.pkglist
make install pkg_file=scripts/pacman/gnome.pkglist

# Clone repos that cannot be installed by pacman
make clone

# Install neovim from source and add plugins through paq
make neovim
make paq

# Link configurations to target destinations
make config

# Enable services, add groups to user and setup firewall
make services
```
