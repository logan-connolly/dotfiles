local M = {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
	keys = {
		{ "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "Search Files" },
		{ "<leader>fr", "<cmd> Telescope git_files hidden=true <CR>", desc = "Git Files" },
		{ "<leader>fF", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Search All" },
		{ "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "Find Buffers" },
		{ "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Help Page" },
		{ "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "Search Recent" },
		{ "<leader>fk", "<cmd> Telescope keymaps <CR>", desc = "Show Keys" },
		{ "<leader>fg", "<cmd> Telescope git_status <CR>", desc = "Show Git Status" },
		{ "<leader>fs", "<cmd> Telescope treesitter <CR>", desc = "Show Treesitter Symbols" },
		{
			"-",
			function()
				require("telescope").extensions.file_browser.file_browser({
					cwd = require("telescope.utils").buffer_dir(),
				})
			end,
			desc = "File browser (vinegar)",
		},
	},
}

function M.config()
	local actions = require("telescope.actions")
	local telescope = require("telescope")
	local borderless = true
	telescope.setup({
		defaults = {
			path_display = { shorten = 2 },
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
						return actions.cycle_history_next(...)
					end,
					["<C-Up>"] = function(...)
						return actions.cycle_history_prev(...)
					end,
				},
			},
			prompt_prefix = " ",
			selection_caret = " ",
			winblend = borderless and 0 or 10,
		},
		pickers = {
			oldfiles = {
				cwd_only = true,
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("file_browser")
end

return M
