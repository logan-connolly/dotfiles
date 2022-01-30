.DEFAULT_GOAL=help

current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

pacman: # Install pacman deps, passing `pkg_file` to pkglist file
	bash $(current_dir)/scripts/install-pacman-pkgs.sh $(pkg_file)

clone: # Install system deps that can't be installed with pacman
	bash $(current_dir)/scripts/clone-repos.sh

neovim: # Build and install latest neovim from source
	bash $(current_dir)/scripts/install-neovim.sh

paq: # Install neovim plugins using paq bootstrap
	nvim --headless -u NONE -c 'lua require("bootstrap").bootstrap_paq()'

config: # Link configuration files to proper locations
	bash $(current_dir)/scripts/symlink-configs.sh

help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
