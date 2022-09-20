# general aliases
alias o='xdg-open'
alias cat='bat --theme="base16-256"'
alias yank='xsel --clipboard'
alias ywd='pwd | yank'
alias ssh='kitty +kitten ssh'

# neovim
alias v='nvim'

# direnv
alias di='echo dotenv > .envrc && touch .env && direnv allow'
alias dipy='echo "layout pyenv 3.9.10" >> .envrc && direnv allow'
alias didb='echo "layout postgres" >> .envrc && direnv allow'

# python
alias pu='pip install -U pip setuptools wheel'

# docker
alias dc='docker-compose'

# tmux
alias tmux='direnv exec / tmux'
alias tmw='tmux-sessionizer ~/projects/work'
alias tmf='tmux-sessionizer ~/projects/personal'
alias tml='tmux list-sessions'
alias tmka='tmux ls | cut -d: -f1 | xargs -I {} sh -c "tmux kill-session -t {}"'

# list files
alias ls='exa'
alias ll='exa --long --icons'
alias la='exa --all --long --icons'
alias tree="exa --icons --tree -I '__pycache__|.git|venv|node_modules'"

# git
alias lg='lazygit'
alias ga='git add'
alias gb='git branch'
alias gd='git diff --ignore-space-change'
alias gi='git init --quiet'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gr='git reset'
alias grb='git rebase -i --autosquash origin/master'
alias gs='git status'
alias gc='git commit'
alias gca='git commit -a'
alias gcf='git commit --fixup'
alias gcaf='git commit -a --fixup'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias glo='git log --oneline --decorate'
alias gan='git commit --amend --no-edit'
alias gana='git commit --amend --no-edit -a'
