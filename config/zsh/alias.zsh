# open with default
alias o='xdg-open'

# configure files
alias cv='nvim ~/.config/nvim'
alias cz='nvim ~/.zshrc'
alias ci='nvim ~/.config/i3/config'

# use neovim
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

# renaming files
alias rename="perl-rename"

# generate virtual environment
alias venv="python -m venv venv && source venv/bin/activate && pip install -U pip setuptools wheel &> /dev/null"

# swallow terminal apps
alias mpv="i3-swallow mpv"
alias zathura="i3-swallow zathura"
