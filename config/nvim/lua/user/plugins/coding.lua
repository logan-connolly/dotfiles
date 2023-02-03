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
			{ "<leader>5", "<cmd> lua require('harpoon.ui').nav_file(5)<cr>", desc = "Navigate to file 5" },
			{ "<leader>6", "<cmd> lua require('harpoon.ui').nav_file(6)<cr>", desc = "Navigate to file 6" },
			{ "<leader>7", "<cmd> lua require('harpoon.ui').nav_file(7)<cr>", desc = "Navigate to file 7" },
			{ "<leader>8", "<cmd> lua require('harpoon.ui').nav_file(8)<cr>", desc = "Navigate to file 8" },
		},
	},

	-- surround
	{
		"echasnovski/mini.surround",
		keys = { "gz" },
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "gza", -- Add surrounding in Normal and Visual modes
					delete = "gzd", -- Delete surrounding
					find = "gzf", -- Find surrounding (to the right)
					find_left = "gzF", -- Find surrounding (to the left)
					highlight = "gzh", -- Highlight surrounding
					replace = "gzr", -- Replace surrounding
					update_n_lines = "gzn", -- Update `n_lines`
				},
			})
		end,
	},

	-- comments
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					--require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
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

	-- testing
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "harpoon"
			vim.g["test#python#pytest#options"] = "-vv"
		end,
		keys = {
			{ "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test closest" },
			{ "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test suite" },
			{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
			{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
		},
	},
}
