#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTDIR="$( dirname "$DIR" )"
LN="ln -vsf"
LNDIR="ln -vs"

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

symlink_dirs() {
  $LNDIR $DOTDIR/bin ~/
  $LNDIR $DOTDIR/config/feh ~/.config
  $LNDIR $DOTDIR/config/i3 ~/.config
  $LNDIR $DOTDIR/config/nvim ~/.config
  $LNDIR $DOTDIR/config/qutebrowser ~/.config
  $LNDIR $DOTDIR/config/ranger ~/.config
  $LNDIR $DOTDIR/config/rofi ~/.config
  $LNDIR $DOTDIR/config/picom ~/.config
  $LNDIR $DOTDIR/config/polybar ~/.config
  $LNDIR $DOTDIR/config/zsh ~/.config
}
