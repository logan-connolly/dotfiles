#!/bin/bash

REPO_URL=https://github.com/neovim/neovim
NEOVIM_DIR=${HOME}/.local/opt/neovim

clone_repo() {
  mkdir -p $NEOVIM_DIR
  git clone $REPO_URL --single-branch $NEOVIM_DIR
}

build_install() {
  cd $NEOVIM_DIR
  git pull
  make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
}

[ ! -d "${NEOVIM_DIR}" ] && clone_repo
build_install
