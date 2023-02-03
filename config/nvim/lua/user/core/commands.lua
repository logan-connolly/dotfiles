-- highlight on yank
vim.api.nvim_create_autocmd(
	{ "TextYankPost" },
	{ pattern = { "*" }, command = [[silent! lua vim.highlight.on_yank() {higroup='IncSearch', timeout=400}]] }
)

-- transparent background
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	pattern = { "*" },
	command = [[hi Normal ctermbg=none guibg=none | hi NonText ctermbg=NONE guibg=NONE | hi EndOfBuffer ctermbg=NONE guibg=NONE]],
})

-- filetype space and indentation
vim.api.nvim_create_autocmd(
	{ "Filetype" },
	{ pattern = { "dockerfile", "sh" }, command = [[setlocal tabstop=2 shiftwidth=2 expandtab]] }
)
vim.api.nvim_create_autocmd(
	{ "Filetype" },
	{ pattern = { "markdown" }, command = [[setlocal tabstop=2 shiftwidth=2 expandtab wrap linebreak]] }
)
vim.api.nvim_create_autocmd({ "Filetype" }, { pattern = { "norg" }, command = [[setlocal wrap linebreak]] })

-- add autocomplete for dap repl
vim.api.nvim_create_autocmd(
	{ "Filetype" },
	{ pattern = { "dap-repl" }, command = [[lua require('dap.ext.autocompl').attach()]] }
)
