#!/bin/bash

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
  ttf-font-awesome \
  yay \
  zsh \

yay -S polybar nerd-fonts-source-code-pro

sudo chsh -s $(which zsh)
export TERM=allacrity

mkdir $HOME/.envs && cd $HOME/.envs
python -m venv neovim \
  && source neovim/bin/activate \
  && pip install -U pip setuptools wheel \
  && pip install -r $HOME/github/dotfiles/nvim/requirements.txt \
  && deactivate
