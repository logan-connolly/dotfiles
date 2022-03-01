# Disable default greeting
set fish_greeting

# Source user config files
source ~/.config/fish/user/environment.fish
source ~/.config/fish/user/functions.fish
source ~/.config/fish/user/aliases.fish

# Setup starship shell prompt
starship init fish | source

# Setup direnv 
direnv hook fish | source
