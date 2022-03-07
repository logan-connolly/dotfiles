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

clone_tpm_package_manager() {
  repo=https://github.com/tmux-plugins/tpm
  path="$HOME/.config/tmux/plugins/tpm"
  clone_repo $repo $path
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
  js="typescript-language-server vls @volar/server typescript eslint live-server prettier"
  css="vscode-langservers-extracted @tailwindcss/language-server"
  misc="neovim pyright @ansible/ansible-language-server"
  npm install -g $js $css $misc
}

clone_lua_language_server
clone_node_debug
clone_tpm_package_manager
install_nnn_plugins
install_npm_packages
