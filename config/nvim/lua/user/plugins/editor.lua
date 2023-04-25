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
			float_opts = { border = "curved" },
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
			{
				"\\l",
				function()
					require("user.core.util").toggle_logs()
				end,
				mode = { "n", "t" },
				desc = "Logs",
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

	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>ft", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>fT", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
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
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "diamond",
						},
					},
					["core.dirman"] = {
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
			-- set concealer and fold level for neorg
			vim.api.nvim_create_autocmd({ "Filetype" }, {
				pattern = { "norg" },
				command = [[setlocal wrap linebreak conceallevel=3 concealcursor=nc foldlevel=1]],
			})
		end,
	},
}
