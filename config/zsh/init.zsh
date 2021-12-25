# Lines configured by zsh-newuser-install
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# Setup kitty complete
kitty + complete setup zsh | source /dev/stdin
