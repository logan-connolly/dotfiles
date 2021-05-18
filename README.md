# My Dotfiles

![](docs/screenshots/screenshot-1.png)
![](docs/screenshots/screenshot-2.png)

## Prerequisites

### Arch + i3

Fresh install of [arch](https://archlinux.org/) and [i3](https://i3wm.org/) using [guide](docs/guides/arch-install.txt).

Additional Resources:

- https://wiki.archlinux.org/index.php/installation_guide
- https://averagelinuxuser.com/a-step-by-step-arch-linux-installation-guide/

### Paru package manager

Install [paru](https://github.com/Morganamilo/paru) for downloading AUR packages:

```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## Installation

**Warning:** use at your own risk.

Clone [dotfiles](https://github.com/logan-connolly/dotfiles) repository and install setup:

```shell
git clone https://github.com/logan-connolly/dotfiles.git && cd dotfiles
make setup
```
