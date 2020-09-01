#!/bin/bash

sudo pacman -S \
  alacritty \
  adobe-source-code-pro-fonts \
  base-devel \
  ctags \
  fd \
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
