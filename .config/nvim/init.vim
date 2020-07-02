" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"Install plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mklabs/split-term.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar' "tag (class/function) browser
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

Plug 'morhetz/gruvbox'
call plug#end()

"General settings
syntax on
colorscheme gruvbox

set splitbelow
set splitright
set clipboard+=unnamedplus
set updatetime=250
set mouse=a
set number
set relativenumber

set wildignore+=*.git/*
set wildignore+=*.bak,*~,*.swp,*.lock
set wildignore+=*.o,*.lo,*.ko,*.so
set wildignore+=*build/*,*coverage/*,*_build/*
set wildignore+=*.pyc,*venv/*,*.egg,*.egg-info
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.pdf,*.ps,*.aux,*.bbl,*.docx,*.doc,*.ppt,*.pptx,*.rtf
set wildignore+=*.mp3,*.ogg,*.mpg,*.mp4,*.wav,*.mov


"Key Remapping
nmap <space> \
xmap <space> \

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap Q <nop>

map <leader>x <esc>:bd<cr>

map <C-n> :RangerWorkingDirectoryNewTab<CR>

map <F8> :Git diff<CR>
map <F9> :Gcommit -a<CR>
map <F10> :Gpush<CR>

nnoremap <F12> :buffers<CR>:buffer<Space>
map <esc>[1;0D <C-Left>
map <esc>[1;0C <C-Right>
map <C-Right> :bn<CR>
map <C-Left> :bp<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8

nnoremap t :Term<cr>
nnoremap T :VTerm<cr>
nnoremap tt :TTerm<cr>
nnoremap tp :Term ipython<cr>
nnoremap Tp :Term ipython<cr>
tnoremap <leader><esc> <C-\><C-n><esc><cr>
tnoremap <C-o> <C-\><C-n><esc><cr>

nnoremap <leader>f :Files<cr>
nnoremap <leader>fh :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bl :BLines<cr>
nnoremap <leader>L :Lines<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>c :<C-u>CocList commands<cr>
nnoremap <silent> <leader>i :CocCommand python.setInterpreter<cr>

nmap <leader>ac <Plug>(coc-codeaction)
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <C-t> :TagbarToggle<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>T :TagbarOpen fj<CR>


"File types
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set expandtab |
    \ set autoindent|
    \ set fileformat=unix


" ---------- COC.NVIM ----------
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"documentation hover
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"map for rename current word
nmap <silent> rn <Plug>(coc-rename)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <leader>F <Plug>(coc-format-selected)


"add docstring
let g:pydocstring_doq_path = '/home/manjaro/.envs/neovim3/bin/doq'

"airline status bar configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_them = 'gruvbox'

"fzf configuration
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
