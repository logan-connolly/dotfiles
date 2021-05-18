#!/bin/bash

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

source ./scripts/install-packages.sh
source ./scripts/symlink-configs.sh
source ./scripts/clone-repos.sh
source ./scripts/util.sh

pprint "Installing dependencies ..."
install_packages

pprint "Symlinking configurations ..."
symlink_configs

pprint "Cloning third party repos ..."
clone_repos

pprint "FINISHED: recommend rebooting system"
