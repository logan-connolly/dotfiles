"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
if !exists('g:vscode')
  "General Settings
  source ~/.config/nvim/plug-config/vim-polyglot.vim
  source ~/.config/nvim/vim-plug/plugins.vim
  source ~/.config/nvim/general/settings.vim
  source ~/.config/nvim/general/functions.vim

  "Themes
  source ~/.config/nvim/themes/airline.vim
  source ~/.config/nvim/themes/gruvbox.vim
  source ~/.config/nvim/themes/syntax.vim

  "Plugin Configuration
  source ~/.config/nvim/plug-config/ale.vim
  source ~/.config/nvim/plug-config/closetags.vim
  source ~/.config/nvim/plug-config/fugitive.vim
  source ~/.config/nvim/plug-config/fzf.vim
  source ~/.config/nvim/plug-config/languageClient.vim
  source ~/.config/nvim/plug-config/ncm2.vim
  source ~/.config/nvim/plug-config/ranger.vim
  source ~/.config/nvim/plug-config/vim-commentary.vim
  source ~/.config/nvim/plug-config/vim-sneak.vim

  "Add paths to node and python here
  source ~/.config/nvim/paths.vim

  " Make sure these main mappings are not overwritten
  source ~/.config/nvim/keys/mappings.vim
endif

if exists('g:vscode')
  source ~/.config/nvim/plug-config/vscode.vim
endif