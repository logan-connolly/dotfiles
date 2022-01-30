#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
PACKAGE_LIST_FILE=$1

install_pacman_packages() {
	paru --noconfirm -S --needed - <$PACKAGE_LIST_FILE
}

install_pacman_packages
