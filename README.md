# My Dotfiles

**Warning:** use at your own risk.

![](docs/screenshots/01-screenshot.png)

## Prerequisites

### Arch

Fresh install of [arch](https://archlinux.org/) using [arch bootstrap repo](https://github.com/logan-connolly/bootstrap-arch).

Additional Resources for installing Arch:

- https://wiki.archlinux.org/index.php/installation_guide
- https://averagelinuxuser.com/a-step-by-step-arch-linux-installation-guide/


## Installation

```shell
# Clone dotfiles repo
git clone https://github.com/logan-connolly/dotfiles.git && cd dotfiles

# Install common dependencies
make install pkg_file=scripts/pacman/common.pkglist

# Install desktop environment dependencies (gnome, i3, etc.)
make install pkg_file=scripts/pacman/gnome.pkglist

# Install neovim from source and add plugins
make neovim
make paq

# Link configurations to destination
make symlink

# Clone repos that cannot be installed by pacman
make clone
```
