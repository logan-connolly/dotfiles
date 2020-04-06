call plug#begin('~/.local/share/nvim/plugged')

"python
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/indentpython.vim'
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'
Plug 'psf/black', { 'tag': '19.10b0' }

syntax on

nmap <silent> <leader>d <Plug>(coc-definition)
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <leader>r <Plug>(coc-rename)

let g:ale_linters ={
			\ 'python': ['flake8']
			\}

let python_highlight_all=1
nnoremap <leader>B :Black<cr>

"general
Plug 'universal-ctags/ctags'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mklabs/split-term.vim'

"add keymapping for vista
nmap <leader>g :Vista<cr>
nmap <leader>G :Vista!<cr>
nmap <leader>F :Vista finder<cr>

"add time to airline
:let g:airline_section_b = '%{strftime("%H:%M")}'

"nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

"terminal bindings
nnoremap <leader>t :Term<cr>
nnoremap <leader>T :VTerm<cr>
nnoremap <leader>tt :TTerm<cr>
nnoremap <leader>tp :Term ipython<cr>
nnoremap <leader>Tp :Term ipython<cr>

"fzf configuration
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <leader>f :Files<cr>
nnoremap <leader>fh :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bl :BLines<cr>
nnoremap <leader>l :Lines<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

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
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set expandtab |
    \ set autoindent|
    \ set fileformat=unix

call plug#end()
