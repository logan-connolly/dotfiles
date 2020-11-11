" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" set completeopt to be what ncm2 expects
set completeopt=noinsert,menuone,noselect
set shortmess+=c

let g:SuperTabDefaultCompletionType = "context"
let g:LanguageClient_autoStart = 1
inoremap <c-c> <ESC>

au TextChangedI * call ncm2#auto_trigger()

inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
