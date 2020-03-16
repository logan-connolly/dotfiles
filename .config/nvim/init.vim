call plug#begin('~/.local/share/nvim/plugged')

"Install plugins
Plug 'davidhalter/jedi-vim'
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deople#enable_at_startup = 1
Plug 'deoplete-plugins/deoplete-jedi'
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'

"split navigations
set splitbelow
set splitright

"Enable folding and fold with space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Allow to switch between tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

"Alias for leader key
nmap <space> \
xmap <space> \

"Easily escape terminal
tnoremap <leader><esc> <C-\><C-n><esc><cr>
tnoremap <C-o> <C-\><C-n><esc><cr>

"Set number and change color
set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"Enables to select text without numbers
set mouse=a

" by default, the indent is 2 spaces. 
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" for python files, 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 expandtab

call plug#end()
