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
				autochdir = true,
				workspaces = {
					gtd = "~/notes/gtd",
					journal = "~/notes/journal",
				},
			},
		},
		["core.norg.concealer"] = {
			config = {
				markup_preset = "conceal",
				icon_preset = "diamond",
			}
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp"
			},
		},
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
			},
		},
		["core.norg.journal"] = {
			config = {
				workspace = "journal",
				strategy = "nested",
      },
    },
		["core.presenter"] = {
			config = {
					zen_mode = "zen-mode",
					slide_count = {
							enable = true,
							position = "top",
							count_format = "[%d/%d]",
					},
			},
		},
	},
})

vim.keymap.set("n", "<leader>nt", "<cmd>Neorg workspace gtd<cr>")
vim.keymap.set("n", "<leader>na", "<cmd>Neorg gtd capture<cr>")
vim.keymap.set("n", "<leader>nv", "<cmd>Neorg gtd views<cr>")
vim.keymap.set("n", "<leader>ne", "<cmd>Neorg gtd edit<cr>")
vim.keymap.set("n", "<leader>nf", "<cmd>Neorg presenter start<cr>")

local kb = "<cmd>Neorg keybind all "

vim.keymap.set("n", "<leader>nd", kb .. "core.norg.qol.todo_items.todo.task_done<cr>")
vim.keymap.set("n", "<leader>np", kb .. "core.norg.qol.todo_items.todo.task_pending<cr>")
vim.keymap.set("n", "<leader>nu", kb .. "core.norg.qol.todo_items.todo.task_undone<cr>")
vim.keymap.set("n", "<leader>nn", kb .. "core.norg.dirman.new.note<cr>")
vim.keymap.set("n", "<leader>nj", kb .. "core.integrations.treesitter.next.heading<cr>")
vim.keymap.set("n", "<leader>nk", kb .. "core.integrations.treesitter.previous.heading<cr>")
