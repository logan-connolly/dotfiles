" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  :let url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs url
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

  "General
  Plug 'AndrewRadev/tagalong.vim', {'for': 'html'}
  Plug 'chrisbra/Colorizer'
  Plug 'justinmk/vim-sneak'
  Plug 'mattn/emmet-vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'

  "Fuzzy Search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  "Language Specific
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'w0rp/ale'

  "Theming
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'hoob3rt/lualine.nvim'

call plug#end()


" automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
