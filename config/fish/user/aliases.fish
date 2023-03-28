# general aliases
alias o='xdg-open'
alias pcat='bat --theme="base16-256"'
alias ssh='kitty +kitten ssh'
alias yank='wl-copy'

# neovim
alias v='nvim'

# direnv
alias di='echo dotenv > .envrc && touch .env && direnv allow'
alias dipy='echo "layout pyenv 3.11.1" >> .envrc && direnv allow'
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
alias ll='exa --long --icons'
alias la='exa --all --long --icons'
alias tree="exa --icons --tree -I '__pycache__|.git|venv|node_modules|*.egg-info'"

# lazygit
alias lg='lazygit'

# git
alias g='git status'
alias ga='git add'
alias gam='git commit --amend'
alias gama='git commit --amend -a'
alias gan='git commit --amend --no-edit'
alias gana='git commit --amend --no-edit -a'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcaf='git commit -a --fixup'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcp='git cherry-pick'
alias gd='git diff --ignore-space-change'
alias gds="git diff --ignore-space-change --staged"
alias gf="git fetch origin --prune"
alias gi='git init --quiet'
alias gl='git log'
alias glf='git log -p'
alias glo='git log --oneline --decorate'
alias gls='git log --stat'
alias glb='git log --reverse --pretty="- %s" origin/master..'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gr='git restore'
alias grb='git rebase -i --autosquash origin/master'
alias grs='git restore --staged'
alias gR='git reset'
alias gs='git status'
alias gS='git stash'
alias gSp='git stash pop'
alias gSc='git stash clear'
