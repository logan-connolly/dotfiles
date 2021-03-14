#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

source ./scripts/install-packages.sh
source ./scripts/symlink-configs.sh
source ./scripts/clone-repos.sh
source ./scripts/enable-services.sh

echo "Installing pacman packages ..."
install_pacman_packages
echo "Installing npm global dependencies ..."
install_npm_packages
echo "Symlinking configuration files ..."
symlink_files
echo "Symlinking configuration directories ..."
symlink_dirs
echo "Cloning third party repos ..."
clone_gruvbox_gtk
clone_ranger_devicons
echo "Enabling system services ..."
enable_services
echo "FINISHED: recommend rebooting system"
