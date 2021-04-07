local defaults = { noremap = true, silent = true }

Keybind.g({
	{ 'n', 'f', [[<Cmd>lua require'hop'.hint_char1()<CR>]], defaults },
	{ 'n', 'F', [[<Cmd>lua require'hop'.hint_char2()<CR>]], defaults },
})
