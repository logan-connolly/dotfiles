syntax on

set clipboard+=unnamedplus
set noshowmode
set splitbelow
set splitright
set noswapfile
set nobackup
set nowritebackup
set updatetime=250
set mouse=a
set number
set nohlsearch
set incsearch
set relativenumber
set ignorecase
set smartcase
set noerrorbells
set hidden
set fileformat=unix
set expandtab
set wildignore+=*.git/*
set wildignore+=*.bak,*~,*.swp,*.lock
set wildignore+=*.o,*.lo,*.ko,*.so
set wildignore+=*build/*,*coverage/*,*_build/*
set wildignore+=*.pyc,*venv/*,*.egg,*.egg-info
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.pdf,*.ps,*.aux,*.bbl,*.docx,*.doc,*.ppt,*.pptx,*.rtf
set wildignore+=*.mp3,*.ogg,*.mpg,*.mp4,*.wav,*.mov
set wildignore+=*.node_modules/*
set tabstop=2
set softtabstop=2
set shiftwidth=2
set colorcolumn=90
set completeopt=menuone,noinsert,noselect

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"Builtin nerdtree like settings
let g:netrw_localrmdir='rm -r'
let g:netrw_banner = 0
