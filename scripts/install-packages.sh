#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PKGINSTALL="paru --noconfirm -S --needed"

install_pacman_packages() {
  $PKGINSTALL - < $SCRIPT_DIR/data/pkglist.txt
  $PKGINSTALL - < $SCRIPT_DIR/data/aur.txt
}

setup_npm_global() {
	mkdir -p $HOME/.npm-global
	npm config set prefix '~/.npm-global'
}

install_npm_packages() {
	setup_npm_global
	general="eslint live-server neovim prettier"
	lsp="typescript-language-server vls pyright vscode-css-languageserver-bin"
	npm install -g $general $lsp
}
