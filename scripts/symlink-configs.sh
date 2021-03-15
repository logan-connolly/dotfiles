#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTDIR="$( dirname "$DIR" )"
LN="ln -vsf"

symlink_files() {
  $LN $DOTDIR/config/alacritty.yml ~/.config/alacritty.yml
  $LN $DOTDIR/config/.flake8 ~/.flake8
  $LN $DOTDIR/config/.gitconfig ~/.gitconfig
  $LN $DOTDIR/config/.inputrc ~/.inputrc
  $LN $DOTDIR/config/.mimeapps.list ~/.config/.mimeapps.list
  $LN $DOTDIR/config/.pylintrc ~/.pylintrc
  $LN $DOTDIR/config/.xinitrc ~/.xinitrc
  $LN $DOTDIR/config/.Xresources ~/.Xresources
  $LN $DOTDIR/config/.zshrc ~/.zshrc
  $LN $DOTDIR/config/.zprofile ~/.zprofile
}

symlink_dir() {
  dot_config_dir=$1
  output_config_dir=$2
  rm -rf $output_config_dir
  ln -vs $dot_config_dir $output_config_dir
}

symlink_dirs() {
  symlink_dir $DOTDIR/config/dunst ~/.config/dunst
  symlink_dir $DOTDIR/config/feh ~/.config/feh
  symlink_dir $DOTDIR/config/i3 ~/.config/i3
  symlink_dir $DOTDIR/config/nvim ~/.config/nvim
  symlink_dir $DOTDIR/config/qutebrowser ~/.config/qutebrowser
  symlink_dir $DOTDIR/config/ranger ~/.config/ranger
  symlink_dir $DOTDIR/config/rofi ~/.config/rofi
  symlink_dir $DOTDIR/config/picom ~/.config/picom
  symlink_dir $DOTDIR/config/polybar ~/.config/polybar
  symlink_dir $DOTDIR/config/zsh ~/.config/zsh
}
