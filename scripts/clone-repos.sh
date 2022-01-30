#!/bin/bash

clone_repo() {
  REPO_URL=$1
  REPO_PATH=$2
  rm -rf $REPO_PATH && mkdir -p $REPO_PATH
  git clone $REPO_URL --single-branch $REPO_PATH
}

clone_lua_language_server() {
  repo=https://github.com/sumneko/lua-language-server.git
  path="$HOME/.local/opt/lua-language-server"
  clone_repo $repo $path
}

clone_node_debug() {
  repo=https://github.com/microsoft/vscode-node-debug2.git
  path="$HOME/.local/opt/vscode-node-debug2"
  clone_repo $repo $path
  cd $path
  npm install
  gulp build
}

install_nnn_plugins() {
	curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
}

setup_npm_global() {
	mkdir -p $HOME/.npm-global
	npm config set prefix '~/.npm-global'
}

install_npm_packages() {
	setup_npm_global
	general="eslint live-server neovim prettier castnow"
	lsp="typescript typescript-language-server vls pyright vscode-css-languageserver-bin"
	npm install -g $general $lsp
}

clone_lua_language_server
clone_node_debug
install_nnn_plugins
install_npm_packages
