local defaults = { noremap = true, silent = true }

Keybind.g({
	{ 'n', '<Leader>gs', [[<Cmd>G<CR>]], { noremap = false, silent = true } },
	{ 'n', '<Leader>ga', [[<Cmd>Git fetch --all<CR>]], defaults },
	{ 'n', '<Leader>gf', [[<Cmd>diffget //2<CR>]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gj', [[<Cmd>diffget //3<CR>]], { noremap = false, silent = true } },
	{ 'n', '<Leader>gp', [[<Cmd>G push<CR>]], defaults },
})
