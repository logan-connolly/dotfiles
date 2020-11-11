# open with default
alias o='xdg-open'

# configure files
alias cv='nvim ~/.config/nvim'
alias cz='nvim ~/.zshrc'
alias ci='nvim ~/.i3/config'

# use neovim
alias vim='nvim'
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

alias ipython="~/.envs/base/bin/ipython"
