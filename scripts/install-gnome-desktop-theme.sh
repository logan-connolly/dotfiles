#!/bin/bash

REPO="https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme"
REPO_PATH="$HOME/.local/opt/Gruvbox-GTK-Theme"

clone_gruvbox_repo() {
  echo "🤖 Cloning repo to ${REPO_PATH} ..."
  rm -rf $REPO_PATH && mkdir -p $REPO_PATH
  git clone $REPO $REPO_PATH
}
sync_config_files() {
  echo "🤖 Synchronising configuration files ..."
  mkdir -p ~/.themes ~/.icons ~/.config/gtk-4.0
  cp -r ${REPO_PATH}/themes/Gruvbox-Dark-BL ~/.themes/
  cp -r ${REPO_PATH}/icons/Gruvbox_Dark ~/.icons/
  cp -r ${REPO_PATH}/themes/Gnome42/gtk-Gruvbox-Dark-BL.css ~/.config/gtk-4.0/
}

clone_gruvbox_repo
sync_config_files

echo
echo "✅ Go into Gnome Tweaks and set icons and themes."
echo
