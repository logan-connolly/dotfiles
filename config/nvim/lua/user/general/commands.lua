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
	},
	ftplugin_settings = {
		{ "Filetype", "dockerfile,lua,sh,zsh", [[setlocal tabstop=2 shiftwidth=2 expandtab]] },
		{ "Filetype", "markdown", [[setlocal tabstop=2 shiftwidth=2 expandtab wrap linebreak]] },
	},
	format_golang = {
		{ "BufWritePre", "*.go,*.py", [[lua vim.lsp.buf.format { async = false }]] },
	},
}

nvim_create_augroups(autocmds)
