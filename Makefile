.PHONY: install neovim symlink clone setup

current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

install:
	bash $(current_dir)/scripts/install-pacman-pkgs.sh $(pkg_file)

neovim:
	bash $(current_dir)/scripts/install-neovim.sh

paq:
	nvim --headless -u NONE -c 'lua require("bootstrap").bootstrap_paq()'

symlink:
	bash $(current_dir)/scripts/symlink-configs.sh

clone:
	bash $(current_dir)/scripts/clone-repos.sh
