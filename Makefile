.PHONY: install neovim symlink clone setup

install:
	bash ./scripts/install-packages.sh

neovim:
	bash ./scripts/install-neovim.sh

symlink:
	bash ./scripts/symlink-configs.sh

clone:
	bash ./scripts/clone-repos.sh

setup: install neovim symlink clone
