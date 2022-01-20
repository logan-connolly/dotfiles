# open with default
alias o='xdg-open'
alias cat='bat --theme="base16-256"'
alias yank='xsel --clipboard'
alias ywd='pwd | yank'
alias ssh='kitty +kitten ssh'
alias firefox='firefox-developer-edition'

# neovim
alias v='nvim'
alias vim='nvim -u "NORC"'

# tmux
alias tm='tmux-sessionizer'
alias tml='tmux list-sessions'
alias tmka='tmux ls | cut -d: -f1 | xargs -I {} sh -c "tmux kill-session -t {}"'

# docker
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

# git
alias gi='git init --quiet'
alias gcm='git commit -m'

# list files
alias nnn='nnn_cd'
alias l='nnn -dc'
alias ls='exa'
alias ll='exa --long --icons'
alias la='exa --all --long --icons'
alias tree="exa --icons --tree -I '__pycache__|.git|venv|node_modules'"

# network aliases
alias nml="nmcli device wifi list"
alias nm="nmcli connection"
alias nmc="nmcli --ask device wifi connect"

# generate virtual environment
alias venv="python -m venv .venv && source .venv/bin/activate && pip install -U pip setuptools wheel &> /dev/null"
alias sa="source .venv/bin/activate"
alias sd="deactivate"
