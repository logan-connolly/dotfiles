local defaults = { noremap = true, silent = true }

Keybind.g({
	{ 'n', '<Leader>gs', [[<Cmd>G<CR>]], { noremap = false, silent = true } },
	{ 'n', '<Leader>ga', [[<Cmd>Git fetch --all<CR>]], defaults },
	{ 'n', '<Leader>gf', [[<Cmd>diffget //2<CR>]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gj', [[<Cmd>diffget //3<CR>]], { noremap = false, silent = true } },
	{ 'n', 'F9', [[<Cmd>G commit -a<CR>]], defaults },
	{ 'n', 'F10', [[<Cmd>G push<CR>]], defaults },
})
