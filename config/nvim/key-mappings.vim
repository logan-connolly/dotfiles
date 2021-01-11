inoremap <C-c> <esc>

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

"Terminal mappings
map <leader>; :split term://zsh<CR>i
map <leader>' :vsplit term://zsh<CR>i
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
tnoremap <C-v><Esc> <Esc>

"Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

"File tree
nnoremap <C-n> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"Resize buffer
nnoremap <Leader>rp :resize 100<CR>

"Source init.vim
nnoremap <leader>` :so ~/.config/nvim/init.vim<cr>

"Omnifunc completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
