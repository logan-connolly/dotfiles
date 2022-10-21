local cmd = vim.api.nvim_command

local function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		cmd("augroup " .. group_name)
		cmd("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			cmd(command)
		end
		cmd("augroup END")
	end
end

local autocmds = {
	lua_highlight = {
		{ "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup='IncSearch', timeout=400}]] },
	},
	transparent_bg = {
		{ "ColorScheme", "*", [[hi Normal ctermbg=none guibg=none]] },
		{ "ColorScheme", "*", [[hi NonText ctermbg=NONE guibg=NONE]] },
		{ "ColorScheme", "*", [[hi EndOfBuffer ctermbg=NONE guibg=NONE]] },
	},
	ftplugin_settings = {
		{ "Filetype", "dockerfile,sh,zsh", [[setlocal tabstop=2 shiftwidth=2 expandtab]] },
		{ "Filetype", "markdown", [[setlocal tabstop=2 shiftwidth=2 expandtab wrap linebreak]] },
		{ "Filetype", "norg", [[setlocal wrap linebreak]] },
	},
	format_golang = {
		{ "BufWritePre", "*.go,*.py", [[lua vim.lsp.buf.format { async = true }]] },
	},
	dap_repl_autocompletion = {
		{ "Filetype", "dap-repl", [[lua require('dap.ext.autocompl').attach()]] },
	},
	dap_debug_test_keymap = {
		{
			"Filetype",
			"python",
			[[lua vim.keymap.set("n", "<leader>td", function() require("dap-python").test_method() end)]],
		},
		{
			"Filetype",
			"go",
			[[lua vim.keymap.set("n", "<leader>td", function() require("dap-go").debug_test() end)]],
		},
	},
}

nvim_create_augroups(autocmds)
