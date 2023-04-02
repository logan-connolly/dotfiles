return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		-- stylua: ignore
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true, silent = true, mode = "i",
			},
			{ "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
			{ "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
		},
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("user.core.config").icons.kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},

	-- git
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>G<cr>", desc = "Git status" },
			{ "<leader>gc", "<cmd>G commit<cr>", desc = "Git commit" },
			{ "<leader>gf", "<cmd>G fetch origin<cr>", desc = "Git fetch origin" },
			{ "<leader>gp", "<cmd>G pull<cr>", desc = "Git pull" },
			{ "<leader>gP", "<cmd>G push --force-with-lease<cr>", desc = "Git push (force)" },
			{ "<leader>gl", "<cmd>G log<cr>", desc = "Git log" },
			{ "<leader>gh", "<cmd>G log --stat %<cr>", desc = "Git log stat" },
			{ "<leader>gd", "<cmd>G diff %<cr>", desc = "Git diff (file)" },
			{ "<leader>gD", "<cmd>G diff<cr>", desc = "Git diff (workspace)" },
			{ "<leader>gb", "<cmd>G blame<cr>", desc = "Git blame" },
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
			end,
		},
	},

	-- testing
	{
		"vim-test/vim-test",
		event = "VeryLazy",
		config = function()
			local tt = require("toggleterm")
			local ttt = require("toggleterm.terminal")

			vim.g["test#custom_strategies"] = {
				tterm = function(cmd)
					tt.exec(cmd)
				end,

				tterm_close = function(cmd)
					local term_id = 0
					tt.exec(cmd, term_id)
					ttt.get_or_create_term(term_id):close()
				end,
			}

			vim.g["test#strategy"] = "tterm"
			vim.g["test#python#pytest#options"] = "-vv"
		end,
		keys = {
			{ "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test closest" },
			{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
			{ "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test suite" },
			{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
			{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
		},
	},
}
