# Dotfiles

**Warning:** Use at your own risk. This repository is adapted to work with arch + i3 WM.

![](static/screenshot.png)

## Installation

Fresh install of [arch](https://archlinux.org/) and [i3](https://i3wm.org/).

Official Guide and Average Linux User article and video:

- Guide: https://wiki.archlinux.org/index.php/installation_guide
- ALU Video: https://www.youtube.com/watch?v=UiYS8xWFXLY
- ALU Article: https://averagelinuxuser.com/a-step-by-step-arch-linux-installation-guide/

Arch Installation from Arch ISO USB:

```shell
# Format drive (3 partitions)
cfdisk /dev/sdX

# Attach filesystems
mkfs.fat -F32 /dev/sdX1
mkfs.ext4 /dev/sdX2
mkfs.ext4 /dev/sdX3

# Mount partitions
mount /dev/sdX2 /mnt
mkdir /mnt/home
mount /dev/sdX3 /mnt/home

# Install system
pacstrap -i /mnt base linux linux-firmware sudo vim zsh

# Generate fstab file for attaching devices at startup
genfstab -U -p /mnt >> /mnt/etc/fstab

# Change to system as root
arch-chroot /mnt /usr/bin/zsh

# Configure Locale (en_US.UTF-8)
vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc

# Configure hostname
echo archPC > /etc/hostname
echo "127.0.1.1 localhost.localdomain archPC" >> /etc/hosts 

# Install essential packages
pacman -S base-devel networkmanager alacritty noto-fonts git openssh

# Enable network manager service
systemctl enable NetworkManger.service

# Set root password
passwd

# Install grub to make system bootable
pacman -S grub efibootmgr
mkdir /boot/efi
mount /dev/sdX1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg

# Reboot into system
exit
umount -R /mnt
reboot

# Create swap file
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap sw 0 0" >> /etc/fstab

# Add user
useradd -m -g users -G wheel -s /usr/bin/zsh archie
passwd archie

# Enable user to be able to use sudo
# Uncomment: %wheel ALL=(ALL) ALL
EDITOR=vim visudo

# Log out of root and login to created user 'archie'
exit

# Install X window system and audio
pacman -S pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server

# Install virtual box guest utils (optional)
pacman -S virtualbox-guest-utils

# Install desktop environment
pacman -S i3
echo "exec i3" > ~/.xinitrc

# Test desktop environment
startx
```

Clone [dotfiles](https://github.com/logan-connolly/dotfiles) repository and submodules:

```shell
$ git clone https://github.com/logan-connolly/dotfiles.git
$ cd dotfiles
$ git submodule init
$ git pull --recurse-submodules
```

Install [yay](https://github.com/Jguer/yay) for downloading AUR packages:

```shell
$ git clone https://aur.archlinux.org/yay.git
$ cd yay && makepkg -si
```

Install [siji](https://github.com/stark/siji) order to get icons in polybar:

```shell
$ mkdir ~/.local/share/fonts
$ git clone https://github.com/stark/siji.git ~/.local/share/fonts
$ cd ~/.local/share/fonts/siji
$ ./install.sh
```

### Configuration

Install packages and create symbolic links to config files:

```shell
$ ./install.sh
```

## Gists

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

### Drive Encryption

Encrypt drive partition with luks via [Average Linux User](https://www.youtube.com/watch?v=ch-wzDyo-wU):

```
# Find out which drive you want to encrypt with (for this example let's say sdb1)
$ sudo fdisk -l

# Set up encrypted drive with password [CAUTION: Drive will be wiped]
$ sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb1

# Unlock encrypted device using given password
$ sudo cryptsetup luksOpen /dev/sdb1 sdb1

# Check that you see device mapped to /dev/mapper/sdb1
$ sudo fdisk -l

# Create filesystem for storing data and remove overhead files
$ sudo mkfs.ext4 /dev/mapper/sdb1
$ sudo tune2fs -m 0 /dev/mapper/sdb1

# Make directory where you want to mount and mount to it
$ sudo mkdir /mnt/encrypted
$ sudo mount /dev/mapper/sdb1 /mnt/encrypted

# Optional: change file permissions to current user
$ sudo chown -R `whoami`:users /mnt/encrypted

# Optional: create test file
$ touch test.txt /mnt/encrypted

# Unmount device and close connection
sudo umount /dev/mapper/sdb1 && sudo cryptsetup luksClose sdb1
```

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

Build and install `neovim` from source:

```shell
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
