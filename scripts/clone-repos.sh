#!/bin/bash

clone_repo() {
	REPO_URL=$1
	REPO_PATH=$2
	rm -rf $REPO_PATH && mkdir -p $REPO_PATH
	git clone $REPO_URL --single-branch $REPO_PATH
}

clone_gruvbox_gtk() {
	repo=https://github.com/jmattheis/gruvbox-dark-gtk.git
	path="$HOME/.themes/gruvbox-dark-gtk"
	clone_repo $repo $path
}

clone_lua_language_server() {
	repo=https://github.com/sumneko/lua-language-server.git
	path="$HOME/.local/opt/lua-language-server"
	clone_repo $repo $path
}

clone_gruvbox_gtk
clone_lua_language_server
