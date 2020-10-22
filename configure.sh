#!/bin/bash

CONFIG_DIR=$1

cd $HOME

link_zsh() {
  rm -f .zshrc && rm -rf zsh;
  ln -s $CONFIG_DIR/.zshrc .zshrc
  ln -s $CONFIG_DIR/zsh zsh
  source ./.zshrc
}


echo "Removing current zsh config and linking new ..."
link_zsh
