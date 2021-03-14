lua require("nvimlua.lsp")

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
