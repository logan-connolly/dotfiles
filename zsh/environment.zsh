# fzf autocompletion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPS="--extended"

# add shell functions to path
export PATH=~/bin:$PATH

# add npm global dir to home
export PATH=~/.npm-global/bin:$PATH
