return {
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},
	{
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.bracketed").setup(opts)
		end,
	},
	{
		"echasnovski/mini.bufremove",
		-- stylua: ignore
		keys = {
			{ "<leader>x", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
			{ "<leader>X", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},
}
