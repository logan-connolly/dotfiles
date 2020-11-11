# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"

# edit PATH
export PATH=~/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

# fzf autocompletion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPS="--extended"
