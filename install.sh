!#/bin/bash
sudo pacman -S \
  alacritty \
  base-devel \
  ctags \
  fd \
  neovim \
  nodejs \
  npm \
  polybar \
  python-pynvim \
  zsh \
  # fonts
  nerd-fonts-source-code-pro \
  ttf-font-awesome \
  ttf-nerd-fonts-symbols \
  ttf-nerd-fonts-symbols-mono

  chsh -s $(which zsh)
  export TERM=allacrity
