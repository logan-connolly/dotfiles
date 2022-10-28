#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR=$PARENT_DIR/config
BIN_DIR=$PARENT_DIR/bin

symlink_dir() {
  dot_config_dir=$1
  output_config_dir=$2
  rm -rf $output_config_dir
  ln -vs $dot_config_dir $output_config_dir
}

create_links() {
  ln -vsf $CONFIG_DIR/.gitconfig ~/.gitconfig
  ln -vsf $CONFIG_DIR/.gitconfig-personal ~/.gitconfig-personal
  ln -vsf $CONFIG_DIR/.gitconfig-work ~/.gitconfig-work
  ln -vsf $CONFIG_DIR/.gitignore_global ~/.gitignore_global
  ln -vsf $CONFIG_DIR/.xinitrc ~/.xinitrc
  ln -vsf $CONFIG_DIR/.Xresources ~/.Xresources
  ln -vsf $CONFIG_DIR/.zprofile ~/.zprofile
  symlink_dir $CONFIG_DIR/dconf/applications ~/.local/share/applications
  symlink_dir $CONFIG_DIR/direnv ~/.config/direnv
  symlink_dir $CONFIG_DIR/fish ~/.config/fish
  symlink_dir $CONFIG_DIR/kitty ~/.config/kitty
  symlink_dir $CONFIG_DIR/nvim ~/.config/nvim
  symlink_dir $CONFIG_DIR/tmux ~/.config/tmux
  symlink_dir $CONFIG_DIR/vifm ~/.config/vifm
  symlink_dir $CONFIG_DIR/zathura ~/.config/zathura
  symlink_dir $BIN_DIR ~/.local/bin
}

create_links
