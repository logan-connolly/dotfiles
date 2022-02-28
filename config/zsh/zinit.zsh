### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
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

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf
