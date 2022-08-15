-- keymaps for compiling and profiling plugins
vim.keymap.set("n", "<leader>pc", function()
	vim.cmd("PackerCompile profile=true")
	vim.notify("Packer plugins were compiled")
end)

vim.keymap.set("n", "<leader>pp", function()
	vim.cmd("PackerProfile")
end)
