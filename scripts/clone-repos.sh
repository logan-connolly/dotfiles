#!/bin/bash

clone_repo() {
  REPO_URL=$1
  REPO_PATH=$2
  rm -rf $REPO_PATH && mkdir -p $REPO_PATH
  git clone $REPO_URL --single-branch $REPO_PATH
}

clone_gruvbox_gtk() {
  gruvbox_gtk_repo=https://github.com/jmattheis/gruvbox-dark-gtk.git
  gruvbox_gtk_path="$HOME/.themes/gruvbox-dark-gtk"
  clone_repo $gruvbox_gtk_repo $gruvbox_gtk_path
}

clone_ranger_devicons() {
  ranger_devicon_repo=https://github.com/alexanderjeurissen/ranger_devicons.git
  ranger_devicon_path="$HOME/.config/ranger/plugins/ranger_devicons"
  clone_repo $ranger_devicon_repo $ranger_devicon_path
}
