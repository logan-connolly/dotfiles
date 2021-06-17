local builtin_module = [['telescope.builtin'.]]
local custom_module = [['plugins.telescope.settings'.]]
local extension_module = [['telescope'.extensions.]]
local defaults = { noremap = true, silent = true }

local function telescope_cmd(module, fn)
	return '<Cmd>lua require' .. module .. fn .. ' <CR>'
end

Keybind.g({
	-- search files
	{ 'n', '<Leader>ff', telescope_cmd(builtin_module, "find_files({ hidden = true })"), defaults },
	{ 'n', '<C-p>', telescope_cmd(builtin_module, 'git_files({ hidden = true })'), defaults },

	-- search word
	{ 'n', '<Leader>fg', telescope_cmd(builtin_module, "grep_string({ search = vim.fn.input('> ') })"), defaults },

	-- tpope/vim-vinegar replacement
	{ 'n', '-', telescope_cmd(builtin_module, "file_browser({ cwd = vim.fn.expand('%:p:h') })"), defaults },

	-- search buffers
	{ 'n', '<Leader>fb', telescope_cmd(builtin_module, 'buffers()'), defaults },

	-- search help pages
	{ 'n', '<Leader>fh', telescope_cmd(builtin_module, 'help_tags()'), defaults },

	-- search projects
	{ 'n', '<Leader>fp', telescope_cmd(extension_module, 'project.project{}'), defaults },

	-- custom searches
	{ 'n', '<Leader>fd', telescope_cmd(custom_module, 'search_dotfiles()'), defaults },
	{ 'n', '<Leader>fP', telescope_cmd(custom_module, 'search_plugins()'), defaults },

  -- browse directory
	{ 'n', '<Leader>fn', telescope_cmd(custom_module, 'browse_dir("~/notes")'), defaults },
})
