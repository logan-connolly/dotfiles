-- highlight on yank
vim.api.nvim_create_autocmd(
	{ "TextYankPost" },
	{ pattern = { "*" }, command = [[silent! lua vim.highlight.on_yank() {higroup='IncSearch', timeout=400}]] }
)

-- filetype space and indentation
vim.api.nvim_create_autocmd(
	{ "Filetype" },
	{ pattern = { "markdown" }, command = [[setlocal tabstop=2 shiftwidth=2 expandtab wrap linebreak]] }
)
