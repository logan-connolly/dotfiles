.DEFAULT_GOAL=help

current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

system: # Install system pacman deps
	bash $(current_dir)/scripts/install-pacman-pkgs.sh ./pacman/system.pkglist
	bash $(current_dir)/scripts/configure-system-apps.sh

gnome-desktop: # Install gnome desktop environment
	bash $(current_dir)/scripts/install-pacman-pkgs.sh ./pacman/gnome.pkglist
	bash $(current_dir)/scripts/install-gnome-desktop-theme.sh
	cat $(current_dir)/config/dconf/user.conf | dconf load /

laptop: # Install deps and configs that are relevant for laptops
	bash $(current_dir)/scripts/configure-laptop.sh

clone: # Install system deps that can't be installed with pacman
	bash $(current_dir)/scripts/clone-repos.sh

fisher-clean: # Clean fish plugins and generated settings
	git clean -xdf config/fish

fisher-install: # Install fish plugins with fisher
	fish $(current_dir)/bin/fisher-install.fish

neovim-servers: # Sync neovim lsp servers, formatters and linters
	nvim -c 'lua require("user.config.mason").bootstrap()'

links: # Link configuration files to proper locations
	bash $(current_dir)/scripts/symlink-configs.sh

services: # Enable services, adapt user groups and setup firewall
	bash $(current_dir)/scripts/enable-services.sh

help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
