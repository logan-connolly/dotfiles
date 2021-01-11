"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"

if !exists('g:vscode')
  "General Settings
  source ~/.config/nvim/plugins.vim
  source ~/.config/nvim/settings.vim
  source ~/.config/nvim/theme.vim
  "Plugin Configurations
  source ~/.config/nvim/plug-config/ale.vim
  source ~/.config/nvim/plug-config/emmet.vim
  source ~/.config/nvim/plug-config/closetags.vim
  source ~/.config/nvim/plug-config/fugitive.vim
  source ~/.config/nvim/plug-config/fzf.vim
  source ~/.config/nvim/plug-config/lsp-config.vim
  source ~/.config/nvim/plug-config/tagalong.vim
  source ~/.config/nvim/plug-config/telescope.vim
  source ~/.config/nvim/plug-config/vim-commentary.vim
  source ~/.config/nvim/plug-config/vim-polyglot.vim
  source ~/.config/nvim/plug-config/vim-sneak.vim
  "Key mappings and auto commands
  source ~/.config/nvim/key-mappings.vim
  source ~/.config/nvim/commands.vim
endif

if exists('g:vscode')
  source ~/.config/nvim/plug-config/vscode.vim
endif
