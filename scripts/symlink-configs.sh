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

common_links() {
  ln -vsf $CONFIG_DIR/.gitconfig ~/.gitconfig
  ln -vsf $CONFIG_DIR/.gitignore_global ~/.gitignore_global
  ln -vsf $CONFIG_DIR/xinit/.xinitrc.gnome ~/.xinitrc
  ln -vsf $CONFIG_DIR/.Xresources ~/.Xresources
  ln -vsf $CONFIG_DIR/.zshrc ~/.zshrc
  ln -vsf $CONFIG_DIR/.zprofile ~/.zprofile
  symlink_dir $CONFIG_DIR/direnv ~/.config/direnv
  symlink_dir $CONFIG_DIR/kitty ~/.config/kitty
  symlink_dir $CONFIG_DIR/nvim ~/.config/nvim
  symlink_dir $CONFIG_DIR/tmux ~/.config/tmux
  symlink_dir $CONFIG_DIR/zathura ~/.config/zathura
  symlink_dir $CONFIG_DIR/zsh ~/.config/zsh
  symlink_dir $BIN_DIR ~/.local/bin
}

i3_links() {
  ln -vsf $CONFIG_DIR/mimeapps.list ~/.config/mimeapps.list
  ln -vsf $CONFIG_DIR/xinit/.xinitrc.i3 ~/.xinitrc
  symlink_dir $CONFIG_DIR/dunst ~/.config/dunst
  symlink_dir $CONFIG_DIR/feh ~/.config/feh
  symlink_dir $CONFIG_DIR/i3 ~/.config/i3
  symlink_dir $CONFIG_DIR/rofi ~/.config/rofi
  symlink_dir $CONFIG_DIR/picom ~/.config/picom
}

common_links

if pgrep -x "i3" > /dev/null
then
  echo "i3 is running, running i3 symlinks"
  i3_links
fi
