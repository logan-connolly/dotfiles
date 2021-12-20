local defaults = { noremap = true, silent = true }

Keybind.g({
  -- builtin
  { 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', defaults },
  { 'n', 'rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', defaults },
  { 'n', 'gh', '<Cmd>lua vim.lsp.buf.references()<CR>', defaults },
  { 'n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', defaults },
  { 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', defaults },
  { 'n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', defaults },
  -- diagnostics
  { 'n', '<Leader>k', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', defaults },
  { 'n', '<Leader>j', '<Cmd>lua vim.diagnostic.goto_next()<CR>', defaults },
  { 'n', '<Leader>L', '<Cmd>lua vim.diagnostic.setqflist()<CR>', defaults },
})
