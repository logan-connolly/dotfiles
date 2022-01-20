### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zinit-zsh/z-a-rust \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# load git aliases
zinit light davidde/git

# load autocompletion
zinit snippet OMZP::docker/_docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::git
zinit snippet OMZP::httpie
zinit snippet OMZP::npm
zinit snippet OMZP::pip
zinit snippet OMZP::python
zinit snippet OMZP::rsync
zinit snippet OMZP::terraform

# vim style navigation
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_CURSOR_STYLE_ENABLED=false

# k - pretty printing ls
zinit light supercrabtree/k

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf
