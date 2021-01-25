#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

DOT_DIR=$HOME/github/dotfiles

install_pacman() {
  yay -S --needed - < pacman/pkglist.txt
}

install_aur() {
  yay -S --needed - < pacman/pkglist-aur.txt
}

install_npm_packages() {
  mkdir -p ~/.npm-global \
    && npm config set prefix '~/.npm-global' \
    && export PATH=~/.npm-global/bin:$PATH \
    && npm install -g \
      eslint \
      live-server \
      neovim \
      prettier \
      typescript-language-server \
      vls
}

config_docker() {
  sudo usermod -aG docker $USER \
    && sudo systemctl enable docker.service \
    && sudo systemctl start docker.service
}

link_configs() {
  # symlink of entire config files
  ln -sf $DOT_DIR/config/.flake8 ~/.flake8
  ln -sf $DOT_DIR/config/.gitconfig ~/.gitconfig
  ln -sf $DOT_DIR/config/.inputrc ~/.inputrc
  ln -sf $DOT_DIR/config/.pylintrc ~/.pylintrc
  ln -sf $DOT_DIR/config/.xinitrc ~/.xinitrc
  ln -sf $DOT_DIR/config/.Xresources ~/.Xresources
  ln -sf $DOT_DIR/config/.zshrc ~/.zshrc
  ln -sf $DOT_DIR/config/.zprofile ~/.zprofile

  # symlink of entire config directories
  ln -sf $DOT_DIR/config/alacritty.yml ~/.config
  ln -sf $DOT_DIR/config/feh ~/.config
  ln -sf $DOT_DIR/config/i3 ~/.config
  ln -sf $DOT_DIR/config/nvim ~/.config
  ln -sf $DOT_DIR/config/ranger ~/.config
  ln -sf $DOT_DIR/config/rofi ~/.config
  ln -sf $DOT_DIR/config/picom ~/.config
  ln -sf $DOT_DIR/config/polybar ~/.config
  ln -sf $DOT_DIR/config/zsh ~/.config

  # symlink misc directories and files
  ln -sf $DOT_DIR/bin ~/
  ln -sf $DOT_DIR/themes ~/.themes
  ln -sf $DOT_DIR/config/moc/keymap ~/.moc
  ln -sf $DOT_DIR/config/moc/config ~/.moc
  ln -sf $DOT_DIR/config/moc/themes ~/.moc
}

enable_services() {
  sudo systemctl enable --now bluetooth.service
  sudo systemctl enable --now nordvpnd.service
  sudo systemctl enable --now reflector.service
  sudo ufw enable
}

echo "Installing pacman packages ..."
install_pacman
echo "Installing AUR packages ..."
install_aur
echo "Installing npm neovim globally ..."
install_npm_packages
echo "Installing docker ..."
config_docker
echo "Link configurations ..."
link_configs
echo "Enable services"
enable_services
