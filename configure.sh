#!/bin/bash

CONFIG_DIR=$HOME/github/dotfiles

cd $HOME

link_zsh() {
  rm -f .zshrc && rm -rf zsh
  ln -s $CONFIG_DIR/.zshrc .zshrc
  ln -s $CONFIG_DIR/zsh zsh
}

link_xresources() {
  rm -f .Xresources
  ln -s $CONFIG_DIR/.Xresources .Xresources
}

link_nvim() {
  rm -rf .config/nvim
  ln -s $CONFIG_DIR/nvim .config/nvim
}

link_i3() {
  rm -f .i3/config
  ln -s $CONFIG_DIR/i3/config .i3/config
}

link_polybar() {
  rm -rf .config/polybar
  ln -s $CONFIG_DIR/polybar .config/polybar
}

link_alacritty() {
  rm -f .config/alacritty.yml
  ln -s $CONFIG_DIR/alacritty/alacritty.yml .config/alacritty.yml
}

link_bin() {
  rm -rf bin
  ln -s $CONFIG_DIR/bin bin
}

link_misc() {
  rm -f .config/pycodestyle
  ln -s $CONFIG_DIR/pycodestyle/pycodestyle .config/pycodestyle
  rm -f .inputrc
  ln -s $CONFIG_DIR/inputrc .inputrc
}


echo "Removing current zsh config and linking new ..."
link_zsh
echo "Removing current Xresources config and linking new ..."
link_xresources
echo "Removing current nvim config and linking new ..."
link_nvim
echo "Removing current i3 config and linking new ..."
link_i3
echo "Removing current polybar config and linking new ..."
link_polybar
echo "Removing current alacritty config and linking new ..."
link_alacritty
echo "Removing current bin dir and linking new ..."
link_bin
echo "Removing current misc config files and linking new ..."
link_misc

echo "Reboot machine to see changes"
