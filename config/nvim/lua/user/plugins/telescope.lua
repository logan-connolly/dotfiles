local M = {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	lazy = true,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "Search Files" },
		{ "<leader>fF", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Search All" },
		{ "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "Find Buffers" },
		{ "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Help Page" },
		{ "<leader>fr", "<cmd> Telescope oldfiles <CR>", desc = "Search Recent" },
		{ "<leader>fk", "<cmd> Telescope keymaps <CR>", desc = "Show Keys" },
		{ "<leader>fg", "<cmd> Telescope git_status <CR>", desc = "Show Git Status" },
		{ "<leader>fs", "<cmd> Telescope treesitter <CR>", desc = "Show Treesitter Symbols" },
		{ "<leader>fn", "<cmd> Telescope find_files cwd=~/Sync/notes <CR>", desc = "Show Notes" },
	},
}

function M.config()
	local actions = require("telescope.actions")
	local telescope = require("telescope")
	local borderless = true
	telescope.setup({
		defaults = {
			layout_strategy = "horizontal",
			layout_config = {
				width = 0.95,
				height = 0.85,
				prompt_position = "top",
				horizontal = {
					preview_width = function(_, cols, _)
						if cols > 200 then
							return math.floor(cols * 0.4)
						else
							return math.floor(cols * 0.6)
						end
					end,
				},
				vertical = {
					width = 0.9,
					height = 0.95,
					preview_height = 0.5,
				},
				flex = {
					horizontal = {
						preview_width = 0.9,
					},
				},
			},
			sorting_strategy = "ascending",
			mappings = {
				i = {
					["<C-Down>"] = function(...)
						return require("telescope.actions").cycle_history_next(...)
					end,
					["<C-Up>"] = function(...)
						return require("telescope.actions").cycle_history_prev(...)
					end,
				},
			},
			prompt_prefix = " ",
			selection_caret = " ",
			winblend = borderless and 0 or 10,
		},
	})

	telescope.load_extension("fzf")
end

return M