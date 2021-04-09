#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTDIR="$( dirname "$DIR" )"
MKDIR="mkdir -p"
PKGINSTALL="yay --noconfirm -S --needed"

install_pacman_packages() {
  $PKGINSTALL - < $DOTDIR/pacman/pkglist.txt
  $PKGINSTALL - < $DOTDIR/pacman/aur.txt
}

install_npm_packages() {
	$MKDIR $HOME/.npm-global
	npm config set prefix '~/.npm-global'
	export PATH=$HOME/.npm-global/bin:$PATH
	general="eslint live-server neovim prettier"
	lsp="typescript-language-server vls pyright vscode-css-languageserver-bin"
	npm install -g $general $lsp
}
