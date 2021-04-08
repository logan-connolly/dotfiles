local defaults = { noremap = true, silent = true }

Keybind.g({
	-- builtin
	{ 'n', 'gd', [[<Cmd>lua vim.lsp.buf.definition()<CR>]], defaults },
	{ 'n', 'gr', [[<Cmd>lua vim.lsp.buf.references()<CR>]], defaults },
	{ 'i', '<Tab>', [[<Plug>(completion_smart_tab)]], { noremap = false, silent = true } },
	{ 'i', '<S-Tab>', [[<Plug>(completion_smart_s_tab)]], { noremap = false, silent = true } },
	-- lspsaga
	{ 'n', 'gp', [[<Cmd>lua require("lspsaga.provider").preview_definition()<CR>]], defaults },
	{ 'n', 'rn', [[<Cmd>lua require("lspsaga.rename").rename()<CR>]], defaults },
	{ 'n', 'gh', [[<Cmd>lua require("lspsaga.provider").lsp_finder()<CR>]], defaults },
	{ 'n', 'K', [[<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>]], defaults },
	{ 'n', 'gs', [[<Cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>]], defaults },
	{ 'n', '<Leader>ca', [[<Cmd>lua require("lspsaga.codeaction").code_action()<CR>]], defaults },
	{ 'n', '<Leader>l', [[<Cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>]], defaults },
	{ 'n', '<Leader>j', [[<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>]], defaults },
	{ 'n', '<Leader>k', [[<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>]], defaults },
	-- terminal
	-- { 'n', '<A-d>', [[<Cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>]], defaults },
	-- { 't', '<A-d>', [[<C-\><C-n>lua require("lspsaga.diagnostic").close_float_terminal()<CR>]], defaults },
})
