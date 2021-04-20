#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

source ./scripts/install-packages.sh
source ./scripts/symlink-configs.sh
source ./scripts/clone-repos.sh
source ./scripts/util.sh

pprint "Installing dependencies ..."
install_pacman_packages
install_npm_packages

pprint "Symlinking configurations ..."
symlink_files
symlink_dirs

pprint "Cloning third party repos ..."
clone_gruvbox_gtk
clone_ranger_devicons
clone_siji

pprint "FINISHED: recommend rebooting system"
