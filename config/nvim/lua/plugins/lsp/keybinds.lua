local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
map('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
map('n', 'gr', "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
map('n', '<leader>k', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
map('n', '<leader>j', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
map('n', '<leader>L', '<cmd>lua vim.diagnostic.setqflist()<cr>', opts)
