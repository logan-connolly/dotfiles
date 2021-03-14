#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Paremeters and Helper Commands
DOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
MKDIR="mkdir -p"
LN="ln -vsf"
LNDIR="ln -vs"
PKGINSTALL="yay --noconfirm -S --needed"

install_pacman_packages() {
  $PKGINSTALL base-devel
  $PKGINSTALL - < pacman/pkglist.txt
  $PKGINSTALL - < pacman/aur.txt
}

install_npm_packages() {
  $MKDIR ~/.npm-global
  npm config set prefix '~/.npm-global'
  export PATH=~/.npm-global/bin:$PATH
  pkgs="eslint live-server neovim prettier typescript-language-server vls"
  npm install -g $pkgs
}

symlink_files() {
  $LN $DOTDIR/config/alacritty.yml ~/.config/alacritty.yml
  $LN $DOTDIR/config/.flake8 ~/.flake8
  $LN $DOTDIR/config/.gitconfig ~/.gitconfig
  $LN $DOTDIR/config/.inputrc ~/.inputrc
  $LN $DOTDIR/config/.mimeapps.list ~/.config/.mimeapps.list
  $LN $DOTDIR/config/.pylintrc ~/.pylintrc
  $LN $DOTDIR/config/.xinitrc ~/.xinitrc
  $LN $DOTDIR/config/.Xresources ~/.Xresources
  $LN $DOTDIR/config/.zshrc ~/.zshrc
  $LN $DOTDIR/config/.zprofile ~/.zprofile
}

symlink_dirs() {
  $LNDIR $DOTDIR/bin ~/
  $LNDIR $DOTDIR/config/feh ~/.config
  $LNDIR $DOTDIR/config/i3 ~/.config
  $LNDIR $DOTDIR/config/nvim ~/.config
  $LNDIR $DOTDIR/config/qutebrowser ~/.config
  $LNDIR $DOTDIR/config/ranger ~/.config
  $LNDIR $DOTDIR/config/rofi ~/.config
  $LNDIR $DOTDIR/config/picom ~/.config
  $LNDIR $DOTDIR/config/polybar ~/.config
  $LNDIR $DOTDIR/config/zsh ~/.config
}

clone_repos() {
  gruvbox_gtk_repo=https://github.com/jmattheis/gruvbox-dark-gtk.git
  gruvbox_gtk_path="$HOME/.themes/gruvbox-dark-gtk"
  ranger_devicon_repo=https://github.com/alexanderjeurissen/ranger_devicons.git
  ranger_devicon_path="$HOME/.config/ranger/plugins/ranger_devicons"
  rm -rf $gruvbox_gtk_path && $MKDIR $gruvbox_gtk_path
  rm -rf $ranger_devicon_path && $MKDIR $ranger_devicon_path
  git clone $gruvbox_gtk_repo --single-branch $gruvbox_gtk_path
  git clone $ranger_devicon_repo --single-branch $ranger_devicon_path
}

enable_services() {
  sudo usermod -aG docker $USER
  sudo systemctl enable --now docker.service
  sudo systemctl enable --now bluetooth.service
  sudo systemctl enable --now reflector.service
  sudo ufw enable
}

echo "Installing pacman packages ..."
install_pacman_packages
echo "Installing npm neovim globally ..."
install_npm_packages
echo "Symlinking configuration files ..."
symlink_files
echo "Symlinking configuration directories ..."
symlink_dirs
echo "Cloning third party repos ..."
clone_repos
echo "Enabling system services ..."
enable_services
echo "FINISHED: recommend rebooting system"
