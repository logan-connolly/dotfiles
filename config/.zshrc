# Lines configured by zsh-newuser-install
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
source "${HOME}/.config/zsh/environment.zsh"
source "${HOME}/.config/zsh/history.zsh"
source "${HOME}/.config/zsh/alias.zsh"
source "${HOME}/.config/zsh/zinit.zsh"

export PATH="$HOME/.poetry/bin:$PATH"
export LIBGL_DRI3_DISABLE=1
