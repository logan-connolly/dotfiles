local defaults = { noremap = true, silent = true }

Keybind.g({
	{ 'n', 'gd', [[<Cmd>lua vim.lsp.buf.definition()<CR>]], defaults },
	{ 'n', 'gD', [[<Cmd>lua vim.lsp.buf.declaration()<CR>]], defaults },
	{ 'n', 'gr', [[<Cmd>lua vim.lsp.buf.references()<CR>]], defaults },
	{ 'n', 'rn', [[<Cmd>lua vim.lsp.buf.rename()<CR>]], defaults },
	{ 'n', 'K', [[<Cmd>lua vim.lsp.buf.hover()<CR>]], defaults },
})
