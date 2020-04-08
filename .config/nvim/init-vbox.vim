" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.local/share/nvim/plugged')

"ide
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar' "tag (class/function) browser
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'

"python
Plug 'vim-scripts/indentpython.vim'
Plug 'dense-analysis/ale'
Plug 'psf/black', { 'tag': '19.10b0' }

"general
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mklabs/split-term.vim'

"themes
Plug 'morhetz/gruvbox'

call plug#end()

syntax on

"set colorscheme
colorscheme gruvbox

"alias for leader key
nmap <space> \
xmap <space> \

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

set clipboard+=unnamedplus
set updatetime=250

map <leader>x <esc>:bd<cr>

map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l
map <leader>h <c-w>h


"set number and change color
set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


" ---------- COC.NVIM ----------

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

"remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"coclist functions
nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>c :<C-u>CocList commands<cr>
nnoremap <silent> <leader>i :CocCommand python.setInterpreter<cr>

" Map for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"tagbar
nmap <C-t> :TagbarToggle<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>T :TagbarOpen fj<CR>


"python configuration
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set expandtab |
    \ set autoindent|
    \ set fileformat=unix


"code formatting
let g:ale_linters ={
			\ 'python': ['flake8']
			\}


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


"buffer switching
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


" wildignoresettings
set wildignore+=*.pyc
set wildignore+=*venv/*
set wildignore+=*.gem
set wildignore+=*.bak,*~,*.swp,*.lock
set wildignore+=*.o,*.lo,*.ko,*.so
set wildignore+=*.git/*
set wildignore+=*.svn/*
set wildignore+=*_build/*
set wildignore+=*build/*
set wildignore+=*coverage/*
set wildignore+=*.egg
set wildignore+=*.egg-info
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.pdf,*.ps,*.aux,*.bbl,*.docx,*.doc,*.ppt,*.pptx,*.rtf
set wildignore+=*.mp3,*.ogg,*.mpg,*.mp4,*.wav,*.mov


"nerd tree
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
map <C-n> :NERDTreeToggle<CR>



"terminal bindings
nnoremap t :Term<cr>
nnoremap T :VTerm<cr>
nnoremap tt :TTerm<cr>
nnoremap tp :Term ipython<cr>
nnoremap Tp :Term ipython<cr>


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
nnoremap <leader>L :Lines<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END


"split navigations
set splitbelow
set splitright


"enable folding and fold with space
set foldmethod=indent
set foldlevel=99
nnoremap <C-space> za


"easily escape terminal
tnoremap <leader><esc> <C-\><C-n><esc><cr>
tnoremap <C-o> <C-\><C-n><esc><cr>


"enables to select text without numbers
set mouse=a


"by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2


"html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
