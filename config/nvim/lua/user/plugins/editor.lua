return {
	-- which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["\\"] = { name = "+launch" },
				["<leader>g"] = { name = "+git" },
				["<leader>h"] = { name = "+hunks" },
				["<leader>f"] = { name = "+find" },
				["<leader>m"] = { name = "+mergetool" },
				["<leader>n"] = { name = "+neorg" },
			})
		end,
	},

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = true,
		opts = {
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "curved",
				width = 180,
				height = 65,
			},
		},
		keys = {
			{ "<Esc><Esc>", [[<C-\><C-n>]], mode = "t", desc = "Switch to normal mode", silent = true },
			{ "\\\\", "<cmd> ToggleTerm <cr>", mode = { "n", "t" }, desc = "Terminal" },
			{
				"\\g",
				function()
					require("user.core.util").toggle_lazygit()
				end,
				mode = { "n", "t" },
				desc = "Lazygit",
			},
			{
				"\\t",
				function()
					require("user.core.util").toggle_btop()
				end,
				mode = { "n", "t" },
				desc = "Btop",
			},
			{
				"\\f",
				function()
					require("user.core.util").toggle_vifm()
				end,
				mode = { "n", "t" },
				desc = "Vifm",
			},
		},
	},

	-- harpoon
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>fa", "<cmd> lua require('harpoon.mark').add_file()<cr>", desc = "Add file to harpoon" },
			{ "<leader>fm", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon menu" },
			{ "<leader>fN", "<cmd> lua require('harpoon.ui').nav_next()<cr>", desc = "Navigate to next file" },
			{ "<leader>fP", "<cmd> lua require('harpoon.ui').nav_prev()<cr>", desc = "Navigate to prev file" },
			{ "<leader>1", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", desc = "Navigate to file 1" },
			{ "<leader>2", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", desc = "Navigate to file 2" },
			{ "<leader>3", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", desc = "Navigate to file 3" },
			{ "<leader>4", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "Navigate to file 4" },
		},
	},

	-- comments
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	-- references
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
					pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
				end,
			})
		end,
		-- stylua: ignore
		keys = {
			{ "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
			{ "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
		},
	},

	-- buffer remove
	{
		"echasnovski/mini.bufremove",
		-- stylua: ignore
		keys = {
			{ "<leader>x", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
			{ "<leader>X", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
		},
	},

	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
		},
	},

	-- neorg
	{
		"nvim-neorg/neorg",
		event = "VeryLazy",
		keys = {
			{ "<leader>nn", "<cmd>Neorg workspace notes<cr>", desc = "Open notes" },
			{ "<leader>nw", "<cmd>Neorg workspace work<cr>", desc = "Open work notes" },
			{ "<leader>nr", "<cmd>Neorg return<cr>", desc = "Return back to project" },
		},
		init = function()
			-- adjust fold level of norg files
			vim.wo.foldlevel = 1
		end,
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.norg.concealer"] = {
						config = {
							icon_preset = "diamond",
						},
					},
					["core.norg.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
								work = "~/notes/work",
							},
							default = "notes",
						},
					},
					["core.export"] = {},
					["core.export.markdown"] = {
						config = {
							extensions = "all",
						},
					},
				},
			})
		end,
	},
}
