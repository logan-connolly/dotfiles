return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Schrink selection", mode = "x" },
		},
		opts = {
			highlight = { enable = true },
			indent = { enable = false },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"go",
				"help",
				"html",
				"javascript",
				"json",
				"lua",
				"norg",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPost",
		config = function(_, opts)
			require("treesitter-context").setup(opts)
		end,
	},
}
