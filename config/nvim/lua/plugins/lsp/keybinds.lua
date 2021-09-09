local defaults = { noremap = true, silent = true }
local expr_defaults = { noremap = true , expr = true , silent = true }

Keybind.g({
  -- compe
  { 'i', '<C-space>', 'compe#complete()', expr_defaults },
  { 'i', '<CR>', 'compe#confirm("<CR>")', expr_defaults },
  { 'i', '<C-e>', 'compe#close()', expr_defaults },
  { 'i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', expr_defaults },
  { 'i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', expr_defaults },
  -- builtin
  { 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', defaults },
  -- lspsaga
  { 'n', 'gp', '<Cmd>lua require("lspsaga.provider").preview_definition()<CR>', defaults },
  { 'n', 'rn', '<Cmd>lua require("lspsaga.rename").rename()<CR>', defaults },
  { 'n', 'gh', '<Cmd>lua require("lspsaga.provider").lsp_finder()<CR>', defaults },
  { 'n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', defaults },
  { 'n', 'gs', '<Cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', defaults },
  { 'n', '<Leader>ca', '<Cmd>lua require("lspsaga.codeaction").code_action()<CR>', defaults },
  { 'n', '<Leader>l', '<Cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', defaults },
  { 'n', '<Leader>j', '<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', defaults },
  { 'n', '<Leader>k', '<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', defaults },
})
