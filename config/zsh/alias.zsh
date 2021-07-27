# open with default
alias o='xdg-open'
alias cat='bat --theme="base16-256"'
alias yank='xsel --clipboard'
alias cpwd='pwd | yank'
alias ssh='kitty +kitten ssh'

# configure files
alias cv='nvim ~/.config/nvim'
alias cz='nvim ~/.zshrc'
alias ci='nvim ~/.config/i3/config'

# neovim
alias v='nvim'
alias vim='nvim -u "NORC"'

# docker
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

# git
alias gi='git init --quiet'
alias gcm='git commit -m'

# nnn
alias nnn='nnn_cd'
alias ls='nnn -dc'
alias k='k -h --no-vcs'
alias ll='k'
alias la='k -a'

# ignore files/dirs with tree
alias tree="tree -I '__pycache__|.git|venv|node_modules'"

# network aliases
alias nml="nmcli device wifi list"
alias nm="nmcli connection"
alias nmc="nmcli --ask device wifi connect"

# renaming files
alias rename="perl-rename"

# generate virtual environment
alias venv="python -m venv .venv && source .venv/bin/activate && pip install -U pip setuptools wheel &> /dev/null"
alias sa="source .venv/bin/activate"
alias sd="deactivate"
