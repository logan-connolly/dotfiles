# Dotfiles

**Warning:** Use at your own risk. This repository is adapted to work with arch + i3 WM.

![](static/screenshot.png)

## Prerequisites

Fresh install of [arch](https://archlinux.org/) and [i3](https://i3wm.org/).

Official Guide and Average Linux User article and video:

- Guide: https://wiki.archlinux.org/index.php/installation_guide
- ALU Article: https://averagelinuxuser.com/a-step-by-step-arch-linux-installation-guide/

## Installation

Clone [dotfiles](https://github.com/logan-connolly/dotfiles) repository and submodules:

```shell
$ git clone https://github.com/logan-connolly/dotfiles.git
```

Install [yay](https://github.com/Jguer/yay) for downloading AUR packages:

```shell
$ git clone https://aur.archlinux.org/yay.git
$ cd yay && makepkg -si
```

Build and install `neovim` from source:

```shell
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Install [siji](https://github.com/stark/siji) order to get icons in polybar:

```shell
$ mkdir ~/.local/share/fonts
$ git clone https://github.com/stark/siji.git ~/.local/share/fonts
$ cd ~/.local/share/fonts/siji
$ ./install.sh
```

Install packages and create symbolic links to config files:

```shell
$ ./install.sh
```

## Gists

### Conventional Commits

- *feat:* (new feature for the user, not a new feature for build script)
- *fix:* (bug fix for the user, not a fix to a build script)
- *docs:* (changes to the documentation)
- *style:* (formatting, missing semi colons, etc; no production code change)
- *refactor:* (refactoring production code, eg. renaming a variable)
- *test:* (adding missing tests, refactoring tests; no production code change)
- *chore:* (updating grunt tasks etc; no production code change)


### System Debugging

Check if any of the system services failed to start:

```shell
$ sudo systemctl --failed
```

### File Permissions

Set restricted permissions for files and directories:

```shell
# Find all directories in desired path and set 755 permission
$ find <path> -type d -exec chmod 755 {} +

# Find all files in desired path and grant only file creator write privs
$ find <path> -type f -exec chmod 644 {} +
```

### Syncing Data

Sync two directories locally:

```shell
# Backup home directory to mounted external drive
rsync -avzh --delete /path/to/directory /mnt/backup/
```

### Search and Replace

```shell
find . -type f -exec sed -i 's/OLD/NEW/g' {} +
```

### Drive Encryption

Encrypt drive partition with luks via [Average Linux User](https://www.youtube.com/watch?v=ch-wzDyo-wU) or [encrypt-drive](./static/encrypt-drive.txt).


### Package Management

Remove unused packages and configurations (orphans) with yay:

```shell
$ yay --clean
```
Export installed packages in system:

```shell
$ yay -Qqen > pkglist.txt
$ yay -Qqem > pkglist-aur.txt
```

Add color to pacman by editing `/etc/pacman.conf`:

```shell
# /etc/pacman.conf
COLOR
```
