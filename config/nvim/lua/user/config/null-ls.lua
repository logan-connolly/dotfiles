local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	vim.notify("Unable to load null-ls")
end

null_ls.setup({
	sources = {
		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		-- golang
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,
		-- general
		null_ls.builtins.formatting.prettier,
	},
})

vim.keymap.set("n", "<c-f>", function()
	vim.lsp.buf.format({ async = true })
end)
