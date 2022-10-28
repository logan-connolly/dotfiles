#!/bin/bash

clone_tpm_package_manager() {
  path="$HOME/.config/tmux/plugins/tpm"
  rm -rf $path && mkdir -p $path
  git clone https://github.com/tmux-plugins/tpm $path
}

install_global_npm_packages() {
	mkdir -p $HOME/.npm-global
	npm config set prefix '~/.npm-global'
  npm install -g neovim
}


clone_tpm_package_manager
install_global_npm_packages
