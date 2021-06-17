# general settings
export LIBGL_DRI3_DISABLE=1

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"

# prepend paths to $PATH
typeset -U path
path=(~/local/bin "$path[@]")
path=(~/.npm-global/bin "$path[@]")
path=(~/.poetry/bin "$path[@]")

# nnn settings
export NNN_BMS='p:~/projects;c:~/.config;d:~/dotfiles'
export NNN_PLUG=

# fzf autocompletion
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | xsel -ib)'
--bind 'ctrl-v:execute(echo {+} | xargs -o nvim)'
"
