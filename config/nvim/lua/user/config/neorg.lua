local neorg_ok, neorg = pcall(require, "neorg")
if not neorg_ok then
	vim.notify("Unable to load neorg config")
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				autochdir = false,
				workspaces = {
					gtd = "~/Sync/notes/gtd",
				},
			},
		},
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
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
			},
		},
	},
})

vim.keymap.set("n", "<leader>na", "<cmd>Neorg gtd capture<cr>")
vim.keymap.set("n", "<leader>nv", "<cmd>Neorg gtd views<cr>")
vim.keymap.set("n", "<leader>ne", "<cmd>Neorg gtd edit<cr>")

vim.keymap.set("n", "<leader>nx", function()
	vim.cmd("Neorg export to-file " .. vim.fn.expand("%:r") .. ".md")
end)

local kb = "<cmd>Neorg keybind all "

vim.keymap.set("n", "<leader>nd", kb .. "core.norg.qol.todo_items.todo.task_done<cr>")
vim.keymap.set("n", "<leader>np", kb .. "core.norg.qol.todo_items.todo.task_pending<cr>")
vim.keymap.set("n", "<leader>nu", kb .. "core.norg.qol.todo_items.todo.task_undone<cr>")
vim.keymap.set("n", "<leader>nj", kb .. "core.integrations.treesitter.next.heading<cr>")
vim.keymap.set("n", "<leader>nk", kb .. "core.integrations.treesitter.previous.heading<cr>")
