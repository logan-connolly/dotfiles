#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


install_pacman() {
  sudo pacman -S \
    alacritty \
    adobe-source-code-pro-fonts \
    base-devel \
    ctags \
    fd \
    firefox \
    neovim \
    nodejs \
    npm \
    python-pynvim \
    rofi \
    ttf-font-awesome \
    yay \
    zathura \
    zathura-pdf-poppler \
    zsh
}

install_aur() {
  yay -S \
    nerd-fonts-source-code-pro \
    polybar \
    xcwd-git
}

create_venv() {
  if [ 1 -d "$HOME/.envs" ]
    then
      echo "Creating .envs directory under home."
      mkdir $HOME/.envs
  fi
}

install_py_pkgs() {
  python -m venv $HOME/.envs/neovim3 \
    && source $HOME/.envs/neovim3/bin/activate \
    && pip install -U pip setuptools wheel \
    && pip install -r ./nvim/requirements.txt \
    && deactivate
}

install_docker() {
  sudo pacman -S docker docker-compose \
    && sudo usermod -aG docker $USER \
    && sudo systemctl enable docker.service \
    && sudo systemctl start docker.service
}

change_shell() {
  chsh -s $(which zsh)
  export TERM=alacritty
}

remove_pkgs() {
  sudo pacman -R \
    epdfview \
    palemoon-bin
}


echo "Installing pacman packages ..."
install_pacman
echo "Installing AUR packages ..."
install_aur
echo "Install python packages ..."
create_venv
install_py_pkgs
echo "Installing docker ..."
install_docker
echo "Changing shell and terminal ..."
change_shell
echo "Finished."
