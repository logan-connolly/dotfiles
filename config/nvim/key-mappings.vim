"Exit insert mode with Ctrl-c
inoremap <C-c> <esc>

"Map leader to space
nmap <space> \
xmap <space> \

"Navigate splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Move individual line up and down
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

"Disable Q keymap
nnoremap Q <nop>

"Close buffer
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

"Omnifunc completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

"Source init.vim
nnoremap <leader>` :so ~/.config/nvim/init.vim<cr>
