let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
lua << EOF
local lspconfig = require'lspconfig'
lspconfig.pyls.setup{
  on_attach = require'completion'.on_attach;
  settings = {
    pyls = {
      plugins = {
        pycodestyle = {enabled = false};
        pyflakes = {enabled = false};
      }
    }
  }
}
EOF

nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<CR>
