" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  :let url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs url
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'alvan/vim-closetag'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'machakann/vim-highlightedyank'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'psf/black', { 'tag': '19.10b0' }
  Plug 'posva/vim-vue'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'turbio/bracey.vim'
  Plug 'vim-airline/vim-airline'
call plug#end()

" automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
