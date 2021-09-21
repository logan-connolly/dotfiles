local defaults = { noremap = true, silent = true }
local popup_opts = '{ popup_opts = { border = "single" }}'

Keybind.g({
  -- builtin
  { 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', defaults },
  { 'n', 'rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', defaults },
  { 'n', 'gh', '<Cmd>lua vim.lsp.buf.references()<CR>', defaults },
  { 'n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', defaults },
  { 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', defaults },
  { 'n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', defaults },
  -- diagnostics
  { 'n', '<Leader>k', '<Cmd>lua vim.lsp.diagnostic.goto_prev(' .. popup_opts .. ')<CR>', defaults },
  { 'n', '<Leader>j', '<Cmd>lua vim.lsp.diagnostic.goto_next(' .. popup_opts .. ')<CR>', defaults },
  { 'n', '<Leader>l', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.diagnostic.show_line_diagnostics()<CR>', defaults },
})
