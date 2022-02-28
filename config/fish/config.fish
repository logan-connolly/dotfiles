# Disable default greeting
set fish_greeting

# Setup starship shell prompt
starship init fish | source

# Source user config files
source ~/.config/fish/user/environment.fish
source ~/.config/fish/user/functions.fish
source ~/.config/fish/user/aliases.fish
