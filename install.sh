#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

DOT_DIR=$HOME/github/dotfiles

install_pacman() {
  sudo pacman -S --needed - < pkglist.txt
}

install_aur() {
  if [ pacman -Qi yay ]; then
      mkdir -p ~/github && cd "$_" && git clone https://aur.archlinux.org/yay.git
      makepkg -si
  fi
  yay -S --needed \
    nerd-fonts-complete \
    nerd-fonts-source-code-pro \
    nordvpn-bin \
    polybar \
    siji-git \
    xcwd-git
}

install_npm_packages() {
  mkdir -p ~/.npm-global \
    && npm config set prefix '~/.npm-global' \
    && export PATH=~/.npm-global/bin:$PATH \
    && npm install -g \
      neovim \
      typescript-language-server \
      eslint \
      prettier
}

config_docker() {
  sudo usermod -aG docker $USER \
    && sudo systemctl enable docker.service \
    && sudo systemctl start docker.service
}

link_configs() {
  # symlink of entire config files
  ln -sf $DOT_DIR/.gitconfig ~/.gitconfig
  ln -sf $DOT_DIR/.inputrc ~/.inputrc
  ln -sf $DOT_DIR/.zshrc ~/.zshrc
  ln -sf $DOT_DIR/.zprofile ~/.zsprofile
  ln -sf $DOT_DIR/.xinitrc ~/.xinitrc
  ln -sf $DOT_DIR/.Xresources ~/.Xresources

  # symlink of entire config directories
  ln -sf $DOT_DIR/config/feh ~/.config
  ln -sf $DOT_DIR/config/i3 ~/.config
  ln -sf $DOT_DIR/config/nvim ~/.config
  ln -sf $DOT_DIR/config/rofi ~/.config
  ln -sf $DOT_DIR/config/polybar ~/.config
  ln -sf $DOT_DIR/config/zsh ~/.config
  ln -sf $DOT_DIR/config/alacritty.yml ~/.config/alacritty.yml

  # symlink misc directories and files
  ln -sf $DOT_DIR/bin ~/
}

enable_services() {
  sudo systemctl enable --now bluetooth.service
  sudo systemctl enable --now nordvpnd.service
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
