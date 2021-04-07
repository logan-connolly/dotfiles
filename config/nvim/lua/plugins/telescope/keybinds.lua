local defaults = { noremap = true, silent = true }

Keybind.g({
	-- search entered word within project
	{ 'n', '<Leader>fg', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], defaults },
	-- search by selected word
	{ 'n', '<Leader>fr', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], defaults },
	-- search by filename in git files
	{ 'n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files({ hidden = true })<CR>]], defaults },
	-- buffer list window
	{ 'n', '<Leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], defaults },
	-- search by filename in all project files
	{ 'n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>]], defaults },
	-- git branches
	{ 'n', '<Leader>fB', [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], defaults },
	-- telescope through dotfiles
	{ 'n', '<Leader>fd', [[<Cmd>lua require('plugins.telescope.settings').search_dotfiles()<CR>]], defaults },
	-- telescope through notes
	{ 'n', '<Leader>fn', [[<Cmd>lua require('plugins.telescope.settings').search_notes()<CR>]], defaults },
})