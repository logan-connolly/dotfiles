# Lines configured by zsh-newuser-install
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
source "${HOME}/zsh/environment.zsh"
source "${HOME}/zsh/history.zsh"
source "${HOME}/zsh/alias.zsh"
source "${HOME}/zsh/zinit.zsh"
