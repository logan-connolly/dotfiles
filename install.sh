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
    rofi \
    ttf-font-awesome \
    yay \
    zsh
}

install_aur() {
  yay -S \
    nerd-fonts-source-code-pro \
    polybar \
    xcwd-git
}

change_shell() {
  sudo chsh -s $(which zsh)
  export TERM=allacrity
}

install_nvim() {
  sudo pacman -S \ 
    neovim \
    nodejs \
    npm \
    python-pynvim 

  if [ 1 -d "$HOME/.envs" ]
    then
      echo "Creating .envs directory under home."
      mkdir $HOME/.envs
  fi

  python -m venv $HOME/.envs/neovim \
    && source $HOME/.envs/neovim/bin/activate \
    && pip install -U pip setuptools wheel \
    && pip install -r ./nvim/requirements.txt \
    && deactivate
}

install_docker() {
  sudo pacman -S docker docker-compose \
    && sudo usermod -aG docker manjaro \
    && sudo systemctl enable docker.service \
    && sudo systemctl start docker.service
}


echo "Installing pacman pacakges ..."
install_pacman
echo "Installing AUR packages ..."
install_aur
echo "Changing shell and terminal ..."
change_shell
echo "Install neovim ..."
install_nvim
echo "Installing docker ..."
install_docker
echo "Finished."
