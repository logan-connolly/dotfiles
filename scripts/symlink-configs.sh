#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PARENT_DIR="$( dirname "$SCRIPT_DIR" )"
CONFIG_DIR=$PARENT_DIR/config

symlink_files() {
  ln -vsf $CONFIG_DIR/alacritty.yml ~/.config/alacritty.yml
  ln -vsf $CONFIG_DIR/.flake8 ~/.flake8
  ln -vsf $CONFIG_DIR/.gitconfig ~/.gitconfig
  ln -vsf $CONFIG_DIR/.inputrc ~/.inputrc
  ln -vsf $CONFIG_DIR/.mimeapps.list ~/.config/.mimeapps.list
  ln -vsf $CONFIG_DIR/.pylintrc ~/.pylintrc
  ln -vsf $CONFIG_DIR/.xinitrc ~/.xinitrc
  ln -vsf $CONFIG_DIR/.Xresources ~/.Xresources
  ln -vsf $CONFIG_DIR/.zshrc ~/.zshrc
  ln -vsf $CONFIG_DIR/.zprofile ~/.zprofile
}

symlink_dir() {
  dot_config_dir=$1
  output_config_dir=$2
  rm -rf $output_config_dir
  ln -vs $dot_config_dir $output_config_dir
}

symlink_dirs() {
  symlink_dir $CONFIG_DIR/dunst ~/.config/dunst
  symlink_dir $CONFIG_DIR/feh ~/.config/feh
  symlink_dir $CONFIG_DIR/i3 ~/.config/i3
  symlink_dir $CONFIG_DIR/nvim ~/.config/nvim
  symlink_dir $CONFIG_DIR/ranger ~/.config/ranger
  symlink_dir $CONFIG_DIR/rofi ~/.config/rofi
  symlink_dir $CONFIG_DIR/picom ~/.config/picom
  symlink_dir $CONFIG_DIR/polybar ~/.config/polybar
  symlink_dir $CONFIG_DIR/zathura ~/.config/zathura
  symlink_dir $CONFIG_DIR/zsh ~/.config/zsh
}
