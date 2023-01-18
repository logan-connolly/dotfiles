local neorg_ok, neorg = pcall(require, "neorg")
if not neorg_ok then
	vim.notify("Unable to load neorg config")
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {
			config = {
				extensions = "all",
			},
		},
		["core.norg.concealer"] = {
			config = {
				markup_preset = "conceal",
				icon_preset = "diamond",
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
	},
})

vim.keymap.set("n", "<leader>nx", function()
	vim.cmd("Neorg export to-file " .. vim.fn.expand("%:r") .. ".md")
end)
vim.keymap.set("n", "<leader>nd", "<cmd>Neorg keybind all core.norg.qol.todo_items.todo.task_done<cr>")
vim.keymap.set("n", "<leader>np", "<cmd>Neorg keybind all core.norg.qol.todo_items.todo.task_pending<cr>")
vim.keymap.set("n", "<leader>nu", "<cmd>Neorg keybind all core.norg.qol.todo_items.todo.task_undone<cr>")
vim.keymap.set("n", "<leader>nj", "<cmd>Neorg keybind all core.integrations.treesitter.next.heading<cr>")
vim.keymap.set("n", "<leader>nk", "<cmd>Neorg keybind all core.integrations.treesitter.previous.heading<cr>")
