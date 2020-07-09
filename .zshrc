# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/manjaro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# add npm global dir to home
export PATH=~/.npm-global/bin:$PATH

# get reverse search e-binding
bindkey '^R' history-incremental-search-backward

# configure files
alias cv='nvim ~/.config/nvim/init.vim'
alias cz='nvim ~/.zshrc'

# use neovim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# ls aliases
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias ls='ls --color=auto'
alias l.='ls -d .* --color=auto'

# ignore files/dirs with tree
alias tree="tree -I '__pycache__|.git|venv|node_modules'"

# network aliases
alias nml="nmcli device wifi list"
alias nm="nmcli connection"
alias nmc="nmcli --ask device wifi connect"

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

# load shell prompt
zinit light romkatv/powerlevel10k
zinit snippet /home/manjaro/.local/share/zshrc/.zsh-theme-gruvbox-material-dark

# load git aliases
zinit light davidde/git

# load autocompletion
zinit snippet OMZP::docker/_docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::python
