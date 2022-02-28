# prepend paths to $PATH
fish_add_path --prepend ~/.local/bin ~/.npm-global/bin ~/.poetry/bin

# default programs
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x TERMINAL "kitty"
set -x BROWSER "firefox-developer-edition"
set -x READER "zathura"
set -x TERM "screen-256color"

# misc settings
set -x LIBGL_DRI3_DISABLE 1
