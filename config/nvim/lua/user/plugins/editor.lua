return {
	-- common utils
	{ "nvim-lua/plenary.nvim" },

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
				width = 130,
				height = 35,
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

	-- git mergetool
	{
		"akinsho/git-conflict.nvim",
		event = "VeryLazy",
		config = true,
		opts = {
			default_mappings = false,
			highlights = {
				incoming = "DiffAdd",
				current = "DiffChange",
			},
		},
		keys = {
			{ "<leader>mo", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose ours (current)" },
			{ "<leader>mt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs (incoming)" },
			{ "<leader>mb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose both" },
			{ "<leader>mn", "<cmd>GitConflictChooseNone<cr>", desc = "Choose none" },
			{ "<leader>m]", "<cmd>GitConflictNextConflict<cr>", desc = "Move to next conflict" },
			{ "<leader>m[", "<cmd>GitConflictPrevConflict<cr>", desc = "Move to prev conflict" },
			{ "<leader>ml", "<cmd>GitConflictListQf<cr>", desc = "List merge conflicts" },
		},
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				-- stylua: ignore start
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>hd", gs.diffthis, "Diff This")
				map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
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
		ft = "norg",
		config = function()
			require("neorg").setup({
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
		end,
		keys = {
			{
				"<leader>nd",
				"<cmd>Neorg keybind all core.norg.qol.todo_items.todo.task_done<cr>",
				desc = "Mark as done",
			},
			{
				"<leader>np",
				"<cmd>Neorg keybind all core.norg.qol.todo_items.todo.task_pending<cr>",
				desc = "Mark as pending",
			},
			{
				"<leader>nu",
				"<cmd>Neorg keybind all core.norg.qol.todo_items.todo.task_undone<cr>",
				desc = "Mark as undone",
			},
			{
				"<leader>nj",
				"<cmd>Neorg keybind all core.integrations.treesitter.next.heading<cr>",
				desc = "Go to next heading",
			},
			{
				"<leader>nk",
				"<cmd>Neorg keybind all core.integrations.treesitter.previous.heading<cr>",
				desc = "Go to prev heading",
			},
		},
	},
}
