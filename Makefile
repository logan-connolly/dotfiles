.PHONY: install neovim symlink clone setup

current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

install:
	bash $(current_dir)/scripts/install-packages.sh

neovim:
	bash $(current_dir)/scripts/install-neovim.sh

paq:
	nvim --headless -u NONE -c 'lua require("bootstrap").bootstrap_paq()'

symlink:
	bash $(current_dir)/scripts/symlink-configs.sh

clone:
	bash $(current_dir)/scripts/clone-repos.sh

setup: install neovim paq symlink clone
