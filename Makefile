.DEFAULT_GOAL=help

current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

system: # Install system pacman deps
	bash $(current_dir)/scripts/install-pacman-pkgs.sh ./pacman/system.pkglist

desktop: # Install desktop environment
	bash $(current_dir)/scripts/install-pacman-pkgs.sh ./pacman/desktop.pkglist

clone: # Install system deps that can't be installed with pacman
	bash $(current_dir)/scripts/clone-repos.sh

fisher-clean: # Clean fish plugins and generated settings
	rm -rf config/fish/completions/ config/fish/conf.d/ config/fish/functions/
	rm config/fish/fish_plugins config/fish/fish_variables

fisher-install: # Install fish plugins with fisher
	fish $(current_dir)/bin/fisher-install.fish

neovim: # Build and install latest neovim from source
	bash $(current_dir)/scripts/install-neovim.sh

paq-install: # Install neovim plugins using paq bootstrap
	nvim --headless -u NONE -c 'lua require("bootstrap").bootstrap_paq()'

paq-clean: # Remove neovim plugins using paq bootstrap
	nvim --headless -u NONE -c 'lua require("bootstrap").clean_paq()'

paq-update: # Update neovim plugins using paq bootstrap
	nvim --headless -u NONE -c 'lua require("bootstrap").update_paq()'

links: # Link configuration files to proper locations
	bash $(current_dir)/scripts/symlink-configs.sh

services: # Enable services, adapt user groups and setup firewall
	bash $(current_dir)/scripts/enable-services.sh

help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
