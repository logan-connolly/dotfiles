local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")

if not nvim_tree_ok then
	vim.notify("Unable to load nvim-tree config")
	return
end

nvim_tree.setup({
	view = {
		side = "right",
	},
})

vim.keymap.set("n", "-", function()
	local cwd = vim.fn.expand("%:p:h")
	nvim_tree.toggle(false, true, cwd)
end)
